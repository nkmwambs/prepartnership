<?php
class Finance_model extends CI_Model {

	private $testModels;

	function __construct() {
		parent::__construct();

		$this -> load -> config('dev_config');
		$this -> get_table_prefix();
		$this -> load -> library('Finance_testData');

		$this -> testModels = new Finance_testData();
	}

	//General Methods

	private $table_prefix = '';

	private function get_table_prefix() {

		$this -> table_prefix = $this -> config -> item('table_prefix');

		return $this -> table_prefix;
	}

	private function checkFolderIsEmptyOrNot($folderName) {
		$files = array();
		if ($handle = opendir($folderName)) {
			while (false !== ($file = readdir($handle))) {
				if ($file != "." && $file != "..")
					$files[] = $file;
				if (count($files) >= 1)
					break;
			}
			closedir($handle);
		}
		return (count($files) > 0) ? TRUE : FALSE;
	}

	private function group_data_by_fcp_id($database_results) {

		$group_by_fcp_id_array = array();

		foreach ($database_results as $row) {

			if (isset($row['fcp_id'])) {
				$group_by_fcp_id_array[$row['fcp_id']] = $row;
			}

		}

		return $group_by_fcp_id_array;
	}

	//Callback Methods

	private function callback_mfr_submitted($fcp, $month_submitted) {

		$mfr_submitted_data = $this -> switch_environment($month_submitted, 'test_mfr_submission_data_model', 'prod_mfr_submission_data_model');

		$group = $this -> group_data_by_fcp_id($mfr_submitted_data);

		$yes_no_flag = 'No';

		//Check if the fcp has an Mfr submitted in the $month_submitted
		if (isset($group[$fcp])) {
			if ($group[$fcp]['closure_date'] == $month_submitted && $group[$fcp]['submitted'] == 1) {
				$yes_no_flag = 'Yes';
			}

		}
		return $yes_no_flag;
	}

	private function callback_bank_statement_uploaded($fcp, $month_uploaded) {

		$bank_statement_submitted = $this -> switch_environment($month_uploaded, 'test_bank_statement_uploaded_model', 'prod_bank_statement_uploaded_model');

		$group = $this -> group_data_by_fcp_id($bank_statement_submitted);

		$yes_no_flag = 'No';

		//Check if the fcp has an Mfr submitted in the $month_submitted
		if (isset($group[$fcp]['closure_date'])) {
			if ($group[$fcp]['closure_date'] == $month_uploaded) {

				$yes_no_flag = $group[$fcp]['file_exists'] ? 'Yes' : 'No';
			}
		}

		return $yes_no_flag;
	}

	private function callback_book_bank_balance($fcp, $month_computed) {

		$bank_cash_balance_data = $this -> switch_environment($month_computed, 'test_book_bank_cash_balance_data_model', 'prod_book_bank_cash_balance_data_model');

		$group = $this -> group_data_by_fcp_id($bank_cash_balance_data);

		$balance_amount = 0.00;

		//Check if the fcp has an Mfr submitted in the $month_submitted
		if (isset($group[$fcp])) {
			if ($group[$fcp]['closure_date'] == $month_computed && $group[$fcp]['account_type'] == 'BC') {

				$balance_amount = $group[$fcp]['balance_amount'];
			}
		}

		return number_format($balance_amount, 2);
	}

	private function callback_statement_bank_balance($fcp, $month_computed) {

		$statement_bank_balance_data = $this -> switch_environment($month_computed, 'test_statement_bank_balance_data_model', 'prod_statement_bank_balance_data_model');

		$statement_bank_balance_amount = 0.00;

		$group = $this -> group_data_by_fcp_id($statement_bank_balance_data);

		//Check if the fcp has an Mfr submitted in the $month_submitted
		if (isset($group[$fcp])) {
			if ($group[$fcp]['closure_date'] == $month_computed) {

				$statement_bank_balance_amount = $group[$fcp]['statement_amount'];
			}
		}

		return number_format($statement_bank_balance_amount, 2);
	}

	private function callback_outstanding_cheques($fcp, $month) {

		$outstanding_cheques_data = $this -> switch_environment($month, 'test_outstanding_cheques_data_model', 'prod_outstanding_cheques_data_model');

		$outstanding_cheques_amount = 0.00;

		$group = $this -> group_data_by_fcp_id($outstanding_cheques_data);

		//Check if the fcp has an Mfr submitted in the $month_submitted
		if (isset($group[$fcp])) {
			if ($group[$fcp]['closure_date'] == $month) {

				$outstanding_cheques_amount = $group[$fcp]['outstanding_cheque_amount'];
			}
		}

		return number_format($outstanding_cheques_amount, 2);
	}

	private function callback_deposit_in_transit($fcp, $month) {

		$deposit_in_transit_data = $this -> switch_environment($month, 'test_deposit_in_transit_data_model', 'prod_deposit_in_transit_data_model');

		$deposit_in_transit_amount = 0.00;

		$group = $this -> group_data_by_fcp_id($deposit_in_transit_data);

		//Check if the fcp has an Mfr submitted in the $month_submitted
		if (isset($group[$fcp])) {
			if ($group[$fcp]['closure_date'] == $month) {

				$deposit_in_transit_amount = $group[$fcp]['deposit_in_transit_amount'];
			}
		}

		return number_format($deposit_in_transit_amount, 2);
	}

	private function callback_bank_reconcile_correct($fcp, $month) {

		$book_bank_balance = str_replace(',', '', $this -> callback_book_bank_balance($fcp, $month));

		$statement_balance = str_replace(',', '', $this -> callback_statement_bank_balance($fcp, $month));

		$outstanding_cheques = str_replace(',', '', $this -> callback_outstanding_cheques($fcp, $month));

		$deposit_in_transit = str_replace(',', '', $this -> callback_deposit_in_transit($fcp, $month));

		$compute_bank_reconcile = ($book_bank_balance + $outstanding_cheques) - $deposit_in_transit;

		$yes_no_flag = 'No';

		if (round($compute_bank_reconcile, 2) == round($statement_balance, 2) && $this -> callback_mfr_submitted($fcp, $month) == "Yes") {
			$yes_no_flag = 'Yes';
		}

		return $yes_no_flag;
	}

	//Prod Models Methods

	private function prod_fcps_with_risk_model() {

		$fcp_array = array();

		$data = $this -> db -> get($this -> table_prefix . 'projectsdetails') -> result_array();

		foreach ($data as $fcp) {

			$fcp_array[$fcp['ID']]['fcp_id'] = $fcp['icpNo'];
			$fcp_array[$fcp['ID']]['risk'] = $fcp['risk'];
		}

		return $fcp_array;
	}

	private function prod_bank_statement_uploaded_model($month_bank_statement_uploaded) {

		$files = array();
		try {
			$dir_path = 'uploads/bank_statements';
			$dir = new DirectoryIterator($dir_path);

			$counter = 1;

			foreach ($dir as $fileinfo) {
				if (!$fileinfo -> isDot()) {

					$file_path = $dir_path . '/' . $fileinfo -> getFilename() . '/' . date('Y-m', strtotime($month_bank_statement_uploaded));

					$yes_no_flag = false;

					if (file_exists($file_path)) {

						if ($this -> checkFolderIsEmptyOrNot($file_path)) {
							$yes_no_flag = true;
						}
					}

					$files[$counter]['fcp_id'] = $fileinfo -> getFilename();
					$files[$counter]['file_exists'] = $yes_no_flag;
					$files[$counter]['closure_date'] = $month_bank_statement_uploaded;

					$counter++;

				}
			}
		} catch(Exception $e) {

		}

		return $files;

	}

	private function prod_statement_bank_balance_data_model($month) {

		$statement_bank_balance_data = array();

		$data = $this -> db -> get_where($this -> table_prefix . 'statementbal', array('month' => $month)) -> result_array();

		foreach ($data as $statement_balance) {

			$statement_bank_balance_data[$statement_balance['balID']]['fcp_id'] = $statement_balance['icpNo'];
			$statement_bank_balance_data[$statement_balance['balID']]['closure_date'] = $statement_balance['month'];
			$statement_bank_balance_data[$statement_balance['balID']]['statement_amount'] = $statement_balance['amount'];

		}
		return $statement_bank_balance_data;
	}

	private function prod_book_bank_cash_balance_data_model($month) {

		$bank_cash_balance_data = array();

		$data = $this -> db -> get_where($this -> table_prefix . 'cashbal', array('month' => $month)) -> result_array();

		foreach ($data as $cash_balance) {
			//Populate Cash Balances
			if ($cash_balance['accNo'] == 'BC') {
				$bank_cash_balance_data[$cash_balance['balID']]['fcp_id'] = $cash_balance['icpNo'];
				$bank_cash_balance_data[$cash_balance['balID']]['closure_date'] = $cash_balance['month'];
				$bank_cash_balance_data[$cash_balance['balID']]['account_type'] = $cash_balance['accNo'];
				$bank_cash_balance_data[$cash_balance['balID']]['balance_amount'] = $cash_balance['amount'];
			}

		}

		return $bank_cash_balance_data;
	}

	private function prod_deposit_in_transit_data_model($month) {

		$transaction_arrays = array();

		$transactions_raised_in_month_not_cleared = $this -> transactions_raised_in_month_not_cleared('CR', $month, 'deposit_in_transit_amount');
		$transactions_raised_in_past_not_cleared = $this -> transactions_raised_in_past_not_cleared('CR', $month, 'deposit_in_transit_amount');
		$transactions_raised_in_month_cleared_in_future = $this -> transactions_raised_in_month_cleared_in_future('CR', $month, 'deposit_in_transit_amount');
		$transactions_raised_in_past_cleared_in_future = $this -> transactions_raised_in_past_cleared_in_future('CR', $month, 'deposit_in_transit_amount');

		$fcps_array = array_column($this -> prod_fcps_with_risk_model(), 'fcp_id');

		$merge_array = array();

		$merge_array = array_merge($transactions_raised_in_month_not_cleared, $transactions_raised_in_past_not_cleared, $transactions_raised_in_month_cleared_in_future, $transactions_raised_in_past_cleared_in_future);
		$cnt = 0;

		foreach ($fcps_array as $fcp) {

			$sum_fcp_deposit_in_transit = 0;
			foreach ($merge_array as $transaction) {
				if ($fcp == $transaction['fcp_id']) {
					$sum_fcp_deposit_in_transit += $transaction['deposit_in_transit_amount'];
					$transaction_arrays[$cnt]['fcp_id'] = $transaction['fcp_id'];
					$transaction_arrays[$cnt]['closure_date'] = $month;
					$transaction_arrays[$cnt]['deposit_in_transit_amount'] = $sum_fcp_deposit_in_transit;
				}
			}
			$cnt++;
		}

		return $transaction_arrays;
	}

	//We will have to pass month aurgumet in prod models
	private function prod_mfr_submission_data_model($month) {
		$mfr_submission_data = array();

		$data = $this -> db -> get_where($this -> table_prefix . 'opfundsbalheader', array('closureDate' => $month)) -> result_array();

		foreach ($data as $mfr_submission) {

			$mfr_submission_data[$mfr_submission['balHdID']]['fcp_id'] = $mfr_submission['icpNo'];
			$mfr_submission_data[$mfr_submission['balHdID']]['closure_date'] = $mfr_submission['closureDate'];
			$mfr_submission_data[$mfr_submission['balHdID']]['submitted'] = $mfr_submission['submitted'];
			$mfr_submission_data[$mfr_submission['balHdID']]['submission_date'] = $mfr_submission['stmp'];
		}

		return $mfr_submission_data;
	}

	private function prod_outstanding_cheques_data_model($month) {

		$transaction_arrays = array();

		$transactions_raised_in_month_not_cleared = $this -> transactions_raised_in_month_not_cleared('CHQ', $month, 'outstanding_cheque_amount');
		$transactions_raised_in_past_not_cleared = $this -> transactions_raised_in_past_not_cleared('CHQ', $month, 'outstanding_cheque_amount');
		$transactions_raised_in_month_cleared_in_future = $this -> transactions_raised_in_month_cleared_in_future('CHQ', $month, 'outstanding_cheque_amount');
		$transactions_raised_in_past_cleared_in_future = $this -> transactions_raised_in_past_cleared_in_future('CHQ', $month, 'outstanding_cheque_amount');

		$fcps_array = array_column($this -> prod_fcps_with_risk_model(), 'fcp_id');

		$merge_array = array();

		$merge_array = array_merge($transactions_raised_in_month_not_cleared, $transactions_raised_in_past_not_cleared, $transactions_raised_in_month_cleared_in_future, $transactions_raised_in_past_cleared_in_future);
		$cnt = 0;

		foreach ($fcps_array as $fcp) {
			$sum_fcp_deposit_in_transit = 0;
			foreach ($merge_array as $transaction) {
				if ($fcp == $transaction['fcp_id']) {
					$sum_fcp_deposit_in_transit += $transaction['outstanding_cheque_amount'];
					$transaction_arrays[$cnt]['fcp_id'] = $transaction['fcp_id'];
					$transaction_arrays[$cnt]['closure_date'] = $month;
					$transaction_arrays[$cnt]['outstanding_cheque_amount'] = $sum_fcp_deposit_in_transit;
				}
			}
			$cnt++;
		}

		return $transaction_arrays;
	}

	private function prod_dashboard_parameters_model() {
		$dashboard_params = array();

		$data = $this -> db -> get($this -> table_prefix . 'dashboard_parameter') -> result_array();

		foreach ($data as $parameter) {

			$dashboard_params[$parameter['dashboard_parameter_id']]['dashboard_parameter_name'] = $parameter['dashboard_parameter_name'];
			$dashboard_params[$parameter['dashboard_parameter_id']]['result_method'] = $parameter['result_method'];
			$dashboard_params[$parameter['dashboard_parameter_id']]['is_requested'] = $parameter['is_requested'];
			$dashboard_params[$parameter['dashboard_parameter_id']]['display_on_dashboard'] = $parameter['display_on_dashboard'];
		}

		return $dashboard_params;
	}

	//Test model methods

	//Switch Environment method for model (prod/test) called in callback methods and build_dashboard_array method

	private function switch_environment($month, $test_method, $prod_method) {

		if ($this -> config -> item('environment') == 'test') {
			return $this -> testModels -> $test_method();
		} elseif ($this -> config -> item('environment') == 'prod') {

			return $this -> $prod_method($month);
		}
	}

	//Transaction methods

	private function transactions_raised_in_past_not_cleared($vtype, $month, $amount_key = "outstanding_cheque_amount") {
		$transaction_array = array();

		$first_day_of_month = date('Y-m-01', strtotime($month));
		$last_day_of_month = date('Y-m-t', strtotime($month));

		$this -> db -> select_sum('totals');
		$this -> db -> select(array('hID', 'icpNo', 'TDate', 'ChqState', 'clrMonth', 'VType'));
		$this -> db -> group_by(array('VType', 'icpNo'));
		$this -> db -> where(array('TDate<' => $first_day_of_month));
		//In Between condition
		$data = $this -> db -> get_where($this -> table_prefix . 'voucher_header', array('VType' => $vtype, 'ChqState' => 0, 'clrMonth' => '0000-00-00')) -> result_array();

		foreach ($data as $transaction) {

			$transaction_array[$transaction['hID']]['fcp_id'] = $transaction['icpNo'];
			$transaction_array[$transaction['hID']]['closure_date'] = $transaction['TDate'];
			$transaction_array[$transaction['hID']][$amount_key] = $transaction['totals'];

		}

		return $transaction_array;
	}

	private function transactions_raised_in_month_not_cleared($vtype, $month, $amount_key = "outstanding_cheque_amount") {
		$transaction_array = array();

		$first_day_of_month = date('Y-m-01', strtotime($month));
		$last_day_of_month = date('Y-m-t', strtotime($month));

		$this -> db -> select_sum('totals');
		$this -> db -> select(array('hID', 'icpNo', 'TDate', 'ChqState', 'clrMonth', 'VType'));
		$this -> db -> group_by(array('VType', 'icpNo'));
		$this -> db -> where(array('TDate>=' => $first_day_of_month, 'TDate<=' => $last_day_of_month));
		//In Between condition
		$data = $this -> db -> get_where($this -> table_prefix . 'voucher_header', array('VType' => $vtype, 'ChqState' => 0, 'clrMonth' => '0000-00-00')) -> result_array();

		foreach ($data as $transaction) {

			$transaction_array[$transaction['hID']]['fcp_id'] = $transaction['icpNo'];
			$transaction_array[$transaction['hID']]['closure_date'] = $transaction['TDate'];
			$transaction_array[$transaction['hID']][$amount_key] = $transaction['totals'];

		}

		return $transaction_array;
	}

	private function transactions_raised_in_month_cleared_in_future($vtype, $month, $amount_key = "outstanding_cheque_amount") {
		$transaction_array = array();

		$first_day_of_month = date('Y-m-01', strtotime($month));
		$last_day_of_month = date('Y-m-t', strtotime($month));

		$this -> db -> select_sum('totals');
		$this -> db -> select(array('hID', 'icpNo', 'TDate', 'ChqState', 'clrMonth', 'VType'));
		$this -> db -> group_by(array('VType', 'icpNo'));
		$this -> db -> where(array('TDate>=' => $first_day_of_month, 'TDate<=' => $last_day_of_month));
		//In Between condition
		$data = $this -> db -> get_where($this -> table_prefix . 'voucher_header', array('VType' => $vtype, 'ChqState' => 1, 'clrMonth >' => $last_day_of_month)) -> result_array();

		foreach ($data as $transaction) {

			$transaction_array[$transaction['hID']]['fcp_id'] = $transaction['icpNo'];
			$transaction_array[$transaction['hID']]['closure_date'] = $transaction['TDate'];
			$transaction_array[$transaction['hID']][$amount_key] = $transaction['totals'];

		}

		return $transaction_array;
	}

	private function transactions_raised_in_past_cleared_in_future($vtype, $month, $amount_key = "outstanding_cheque_amount") {
		$transaction_array = array();

		$first_day_of_month = date('Y-m-01', strtotime($month));
		$last_day_of_month = date('Y-m-t', strtotime($month));

		$this -> db -> select_sum('totals');
		$this -> db -> select(array('hID', 'icpNo', 'TDate', 'ChqState', 'clrMonth', 'VType'));
		$this -> db -> group_by(array('VType', 'icpNo'));
		$this -> db -> where(array('TDate<' => $first_day_of_month));
		//In Between condition
		$data = $this -> db -> get_where($this -> table_prefix . 'voucher_header', array('VType' => $vtype, 'ChqState' => 1, 'clrMonth >' => $last_day_of_month)) -> result_array();

		foreach ($data as $transaction) {

			$transaction_array[$transaction['hID']]['fcp_id'] = $transaction['icpNo'];
			$transaction_array[$transaction['hID']]['closure_date'] = $transaction['TDate'];
			$transaction_array[$transaction['hID']][$amount_key] = $transaction['totals'];

		}

		return $transaction_array;
	}

	//Main render array methods

	public function build_dashboard_array($dashboard_month) {

		//$test = new Finance_testData();

		$fcps_array_with_risk = '';

		if ($this -> config -> item('environment') == 'test') {
			$fcps_array_with_risk = $this -> testModels -> test_fcps_with_risk_model();
		} elseif ($this -> config -> item('environment') == 'prod') {
			$fcps_array_with_risk = $this -> prod_fcps_with_risk_model();
		}

		$parameters_array = $this -> switch_environment('', 'test_dashboard_parameters_model', 'prod_dashboard_parameters_model');

		$final_grid_array = array();

		$final_grid_array['fcps_with_risks'] = array();

		$final_grid_array['parameters'] = array();

		foreach ($fcps_array_with_risk as $fcp_with_risk) {

			$final_grid_array['fcps_with_risks'][$fcp_with_risk['fcp_id']]['risk'] = $fcp_with_risk['risk'];

			foreach ($parameters_array as $key => $value) {

				if ($value['display_on_dashboard'] == 'yes') {

					$final_grid_array['fcps_with_risks'][$fcp_with_risk['fcp_id']]['params'][$key] = call_user_func(array($this, $value['result_method']), $fcp_with_risk['fcp_id'], $dashboard_month);
				}
			}

		}

		foreach ($parameters_array as $key => $value) {
			if ($value['display_on_dashboard'] == 'yes') {
				$final_grid_array['parameters'][$value['is_requested']][$key] = $value['dashboard_parameter_name'];
			}

		}

		return $final_grid_array;
	}

}
