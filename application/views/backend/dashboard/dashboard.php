<?php //create an array that has the following keys: FCP, Risk and param
$test=$this->crud_model->test_grouping();

$grid_array=$this->crud_model->build_dashboard_array('2019-03-31');

$none_requested_params=$grid_array['parameters']['no'];

$requested_params=$grid_array['parameters']['yes'];

print_r($grid_array);


// $fcp_risk_param_array = array();
// 
// $fcp_risk_param_array = array("KE0200" => array("risk" => "High", "parameters" => array("Has the FCP submitted reports (MFR) by the due date per local guideline?", "Is the bank statement for the current period submitted with the report?", "Does the cash balance on report agree to the ending balance on bank statement?")), "KE0215" => array("risk" => "Medium", "parameters" => array("Has the FCP submitted reports (MFR) by the due date per local guideline?", "Is the bank statement for the current period submitted with the report?", "Does the cash balance on report agree to the ending balance on bank statement?")), "KE0415" => array("risk" => "Low", "parameters" => array("Has the FCP submitted reports (MFR) by the due date per local guideline?", "Is the bank statement for the current period submitted with the report?", "Does the cash balance on report agree to the ending balance on bank statement?")), );
// 
// $risk_params_array = array();
// 
// foreach ($fcp_risk_param_array as $fcpkey => $risk_param_value) 
// {
	// foreach ($risk_param_value as $key => $value_params) 
	// {
		// if (is_array($value_params)) 
		// {
			// foreach ($value_params as $key_ => $value_param) 
			// {
				// $risk_params_array[$fcpkey][] = $value_param;
// 
			// }
// 
		// } else 
		// {
			// $risk_params_array[$fcpkey][] = $value_params;
		// }
	// }
// }
// 
// print_r(json_encode($risk_params_array).'<br>');
// 
// print ("______________________________________<br>");
// print_r(json_encode($fcp_risk_param_array));

?>
<div class='row'>
	<div class='col-xs-12'>
		<form class='form-horizontal form-groups-bordered validate'>
			<div class="form-group">
				<label class="control-label col-xs-3">Period</label>
				<div class="col-xs-9">
					<select class="form-control">
						<option>Select period</option>
						<option>Monthly</option>
						<option>Quaterly</option>
						<option>Semi-annually</option>
						<option>Anually</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-3">Parameter</label>
				<div class='col-xs-9' id='parameter_div'>
					<div class='row row_to_clone' style="margin-bottom: 10px;">
						<div class="col-xs-3">
							<select class="form-control">
								<option>Select parameter</option>
								<option>Budget Variance</option>
								<option>Count of petty cash transactions</option>
								<option>Percent petty cash transaction</option>
								<option>Bank statement available</option>
							</select>
						</div>

						<div class="col-xs-3">
							<select class="form-control">
								<option>Select Operator</option>
								<option>Equal To</option>
								<option>Greater Than</option>
								<option>Less Than</option>
								<option>Equal or greater than</option>
								<option>Equal or less than</option>
							</select>
						</div>

						<div class="col-xs-3">
							<input type="text" class="form-control" />
						</div>

						<div class="col-xs-3">
							<button class="btn btn-primary add_parameter">
								Add Parameter
							</button>
						</div>

					</div>

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-3">FCP</label>
				<div class="col-xs-9">
					<select class="form-control select2" multiple="multiple">
						<option>Select FCP</option>
						<option>KE0200</option>
						<option>KE0415</option>
						<option>KE0719</option>
						<option>KE0910</option>
					</select>
				</div>
			</div>

			<div class="form-group">

				<div class="col-xs-offset-6 col-xs-6">
					<button class="btn btn-primary">
						Filter
					</button>
				</div>
			</div>
		</form>

	</div>
</div>
<hr/>
<div class='row'>
	<div class='col-xs-12'>
		
		<table  class='table table-bordered datatable'>
			<thead>
				
				<tr>
					<th rowspan="2">FCP ID</th>
					<th rowspan="2">Risk</th>
					<th colspan="<?=count($none_requested_params);?>">Non Requested Parameters</th>
					<th colspan="<?=count($requested_params);?>">Requested Parameters</th>
				</tr>
				<tr>
					
				<?php 
				 foreach ($none_requested_params as $none_requested_param) {
				 ?>
				     
				     <th><?=$none_requested_param;?></th>
				 <?php 
				 }
				?>
				<!--Requested Parameters-->
				
				<?php 
				 foreach ($requested_params as $requested_param) {
				 ?>
				     
				     <th><?=$requested_param;?></th>
				     
				 <?php 
				 }
				?>
				
				</tr>
			</thead>
			
			<tbody>
				<?php 
				 foreach ($grid_array['fcps_with_risks'] as $fcp_id => $value) { 
				?>
				   <tr>
				   	 <td><?=$fcp_id;?></td>
				   	 <td><?=$value['risk'];?></td>
				   	 <?php
				   	  foreach ($value['params'] as $param) { 
				   	 ?>
				   	   <td><?=$param;?></td>
				   	  <?php
					   }
				   	 ?>
				   </tr>
				<?php 
				 }
				?>
			</tbody>
			
		</table>

		<!-- <table class='table table-bordered datatable'>

			<thead>
				<tr>
					<th></th>
					<th colspan="5">NON REQUESTED PARAMETERS</th>
					<th colspan='3'>QA REQUESTED PARAMETERS</th>
				</tr>

				<tr>
					<th>FCP NO.</th>
					<th>Has the FCP submitted reports (MFR) by the due date per local guideline?</th>
					<th>Does the cash balance on report agree to the ending balance on bank statement?</th>
					<th>Are the uncleared items less than 30 days old?</th>
					<th>Do ending balances appear reasonable (at or below the average monthly balance per fund)?</th>
					<th>Do “actuals” on the Budget vs. Actuals Report equal amounts per the Transactions by Expense Code Report.</th>
					<th>Review invoice copies requested last month. Do invoices appear correct?</th>
					<th>Request the PF conduct a petty cash count during next visit to the FCP.  Does the petty cash count agree with the FCPs count?</th>
					<th>Ask PF to verify that the FCP is meeting its tax obligations (e.g. payment on PAYE and NSSF for staff and volunteers, withholding tax etc.)</th>

				</tr>
			</thead>

			<tbody>
				<tr>
					<td>KE0200</td>
					<td>YES</td>
					<td>10,000</td>
					<td>5</td>
					<td>2.1</td>
					<td>30%</td>
					<td>N/A</td>
					<td>Pending</td>
					<td>Yes</td>

				</tr>

				<tr>
					<td>KE0204</td>
					<td>No</td>
					<td>8,000</td>
					<td>2</td>
					<td>0.1</td>
					<td>13%</td>
					<td>Yes</td>
					<td>Yes</td>
					<td>Pending</td>

				</tr>

				<tr>
					<td>KE0300</td>
					<td>No</td>
					<td>7,000</td>
					<td>3</td>
					<td>4.3</td>
					<td>23%</td>
					<td>Pending</td>
					<td>Pending</td>
					<td>Pending</td>

				</tr>

				<tr>
					<td>KE0212</td>
					<td>YES</td>
					<td>100</td>
					<td>7</td>
					<td>3.1</td>
					<td>11%</td>
					<td>N/A</td>
					<td>N/A</td>
					<td>N/A</td>

				</tr>

				<tr>
					<td>KE0415</td>
					<td>YES</td>
					<td>700</td>
					<td>10</td>
					<td>1.1</td>
					<td>80%</td>
					<td>N/A</td>
					<td>N/A</td>
					<td>N/A</td>

				</tr>

				<tr>
					<td>KE0903</td>
					<td>YES</td>
					<td>30,000</td>
					<td>5</td>
					<td>2.1</td>
					<td>30%</td>
					<td>N/A</td>
					<td>Pending</td>
					<td>N/A</td>

				</tr>
			</tbody>
		</table> -->

	</div>

</div>

<script type="text/javascript">
	jQuery(document).ready(function($) {

		var datatable = $(".datatable").dataTable({
			dom : 'lBfrtip',
			buttons : ['pdf', 'csv', 'excel', 'copy']

		});

		$(".dataTables_wrapper select").select2({
			minimumResultsForSearch : -1
		});
	});
	//Clone row
	$('.add_parameter').on('click', function(ev) {

		var row_to_clone = $(this).closest('.row_to_clone');

		var cloned_row = row_to_clone.clone();

		row_to_clone.after(cloned_row);

		//
		//row_to_clone.find('button').html('Remove Parameter');

		//row_to_clone.find('button').toggleClass('btn-primary btn-danger');

		// row_to_clone.find('button').toggleClass('add_parameter remove_parameter');

		// cloned_row.find('button').addClass('add_parameter');

		//alert(cloned_row.find('button').parent().html());

		ev.preventDefault();

		//alert(row_to_clone.html());
	}); 
</script>