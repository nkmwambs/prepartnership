<?php
if (!defined('BASEPATH'))
	exit('No direct script access allowed');

/*
 *	@author 	: CI Africa Development Team 
 *	date		: 16th March, 2019
 *	Prepartnership Assessment System
 *	https://www.compassionkenya.com
 *	support@compassionkenya.com
 */

class Settings extends CI_Controller {

	function __construct() {
		parent::__construct();
		$this -> load -> database();
		$this -> load -> library('session');
		$this -> session -> set_userdata('view_type', 'settings');

		//set_use_datatable

		/*cache control*/
		$this -> output -> set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this -> output -> set_header('Pragma: no-cache');

	}

	private function load_library() {
		$this -> load -> library('utility_forms');
		return new Utility_forms();
	}

	function assessment_settings($param1 = "view_lead_bio_fields") {
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');

		$page_data['output'] = $this -> $param1();

		$page_data['page_name'] = 'assessment_settings';
		$page_data['view_type'] = "settings";
		$page_data['page_title'] = get_phrase('assessment_settings');
		$this -> load -> view('backend/index', $page_data);
	}

	private function view_compassion_connect_progress_measures() {

		$build_list = $this -> load_library();

		$build_list -> set_use_datatable(false);

		$selected_columns = array("Lead Score Criteria Parameter" => "lead_score_parameter", 'Lead Score Stage' => "connect_stage_name");

		$build_list -> set_selected_fields($selected_columns, "compassion_connect_mapping_id");
		$build_list -> set_panel_title("Compassion Connect Progress Measures");
		
		$join_array = array('connect_stage' => array('connect_stage.connect_stage_id', 'compassion_connect_mapping.lead_score_stage'));

		$build_list -> set_table_join($join_array);

		$action = array('add' => array('href' => 'settings/add_compassion_connect_progress_measure'), 'view' => array('href' => 'settings/view_single_connect_progress_measure'), 'edit' => array('href' => 'settings/edit_connect_progress_measure'), 'delete' => array('href' => 'settings/delete_connect_compassion_progress_measure'));

		$build_list -> set_list_action($action);

		$build_list -> set_db_table("compassion_connect_mapping");

		$build_list -> set_add_form();

		return $build_list -> render_item_list();

	}

	private function view_progress_measures() {

		$build_list = $this -> load_library();

		$build_list -> set_use_datatable(false);

		$selected_columns = array("Progress Measure" => "Progress_Measure_title", 
		'Tools Of Verification' => "verification_tool", "Method of Assessment" => 'assessment_method', 
		"Progress Measure Weight" => "weight", "CC Mapping" => "compassion_connect_mapping.lead_score_parameter");
		
		$join_array = array('compassion_connect_mapping' => array('compassion_connect_mapping.compassion_connect_mapping_id', 'assessment_progress_measure.compassion_connect_mapping'));

		$build_list -> set_table_join($join_array);

		$build_list -> set_selected_fields($selected_columns, "assessment_progress_measure_id");

		$build_list -> set_panel_title("Assessment Progress Measure");

		$action = array('add' => array('href' => 'settings/add_assessment_progress_measure'), 'view' => array('href' => 'settings/view_single_assessment_progress_measure'), 'edit' => array('href' => 'settings/edit_assessment_progress_measure'), 'delete' => array('href' => 'settings/delete_assessment_progress_measure'));

		$build_list -> set_list_action($action);

		$build_list -> set_use_datatable(false);

		$build_list -> set_db_table("assessment_progress_measure");

		$build_list -> set_add_form();

		return $build_list -> render_item_list();

	}

	private function view_assessment_milestones() {

		$build_list = $this -> load_library();

		$build_list -> set_use_datatable(false);

		// $selected_columns = array("Milestone Name" => "milestone_name", "Insert Milestone After" => "insert_after", 'When' => "assessment_period_in_days", "Review Status" => "assessment_review_status", "User Customized Review Status" => "user_customized_review_status");
// 
		// $build_list -> set_selected_fields($selected_columns, "assessment_milestones_id");
		
		$build_list -> set_panel_title("Assessment Milestones");

		$action = array('add' => array('href' => 'settings/add_assessment_milestone'), 'view' => array('href' => 'settings/view_single_assessment_milestones'), 'edit' => array('href' => 'settings/edit_assessment_milestone'), 'delete' => array('href' => 'settings/delete_assessment_milestone'));

		$build_list -> set_list_action($action);

		$build_list -> set_use_datatable(false);

		$build_list -> set_db_table("assessment_milestones");

		$build_list -> set_add_form();

		$build_list -> set_replace_field_value('Insert Milestone After', $this -> crud_model -> get_insert_after_milestone());

		return $build_list -> render_item_list();

	}

	private function view_lead_bio_fields() {

		$build_list = $this -> load_library();

		$selected_columns = array("Field Name" => "lead_bio_fields_name", 'Data Type' => "datatype_name", 
		"Is Field Unique?" => "is_field_unique", "Is Field Null?" => "is_field_null", 
		'Default Value' => 'default_value','Show Field'=>'show_field');

		$build_list -> set_selected_fields($selected_columns, 'lead_bio_fields_id');

		$build_list -> set_panel_title("Lead Bio Fields");

		$action = array('add' => array('href' => 'settings/add_lead_bio_fields'), 'view' => array('href' => 'settings/view_single_lead_bio'), 'edit' => array('href' => 'settings/edit_lead_bio_fields'), 'delete' => array('href' => 'settings/delete_lead_bio_fields'));

		$build_list -> set_list_action($action);

		$join_array['datatype'] = array('datatype.datatype_id','lead_bio_fields.datatype_id');
		
		$build_list->set_replace_field_value(array('is_field_null',array('1'=>'Yes','0'=>'No'),
		'is_field_unique',array('1'=>'Yes','0'=>'No')));
		
		$build_list->set_replace_field_value(array('show_field',array('1'=>'Yes','0'=>'No'),
		'is_field_unique',array('1'=>'Yes','0'=>'No')));
		
		$build_list -> set_table_join($join_array);

		
		$build_list -> set_db_table("lead_bio_fields");

		$build_list -> set_add_form();

		return $build_list -> render_item_list();

	}

	public function add_compassion_connect_progress_measure() {

		$build_form = $this -> load_library();

		$fields[] = array('label' => 'Lead Score Criteria Parameter', 'element' => 'input', 'properties' => array('id' => '', 'class' => '', 'name' => 'lead_score_parameter[]'));

		$options_for_stages = array();
		
		$connect_stages = $this->db->get("connect_stage")->result_object(); 
		
		foreach($connect_stages as $connect_stage){
			$options_for_stages[$connect_stage->connect_stage_id] = array('option'=>$connect_stage->connect_stage_name);
		}
		
		$fields[] = array('label' => 'Connect Lead Score Stage', 'element' => 'select', 'properties' => array('id' => '', 'class' => '', 'name' => 'lead_score_stage[]'), 'options' => $options_for_stages);
		
		$build_form -> set_form_action(base_url() . 'settings/create_new_multiple_records/compassion_connect_mapping');
		$build_form -> set_panel_title('Connect Lead Score Parameters');
		$build_form -> set_view_or_edit_mode('add');

		$this -> load_view($build_form, $fields);
	}


	public function add_assessment_progress_measure() {

		$build_form = $this -> load_library();

		$fields[] = array('label' => 'Progress Measure Title', 'element' => 'input', 'properties' => array('id' => '', 'class' => '', 'name' => 'Progress_measure_title[]'));

		$fields[] = array('label' => 'Verification Tools', 'element' => 'input', 'properties' => array('id' => '', 'class' => '', 'name' => 'verification_tool[]'));

		$fields[] = array('label' => 'Method of assessment', 'element' => 'input', 'properties' => array('id' => '', 'class' => '', 'name' => 'assessment_method[]'));

		$fields[] = array('label' => 'Weight', 'element' => 'select', 'properties' => array('id' => '', 'class' => '', 'name' => 'weight[]'), 'options' => array('1' => array('option' => 1), '2' => array('option' => 2), '3' => array('option' => 3), '4' => array('option' => 4), '5' => array('option' => 5), '6' => array('option' => 6), '7' => array('option' => 7), '8' => array('option' => 8), '9' => array('option' => 9), '10' => array('option' => 10), ));
		$array_connect_measures = $this -> crud_model -> get_connect_mappings();

		$fields[] = array('label' => 'Connect Mapping', 'element' => 'select', 'properties' => array('id' => '', 'class' => '', 'name' => 'compassion_connect_mapping[]'), 'options' => $array_connect_measures, );
		$build_form -> set_form_action(base_url() . 'settings/create_new_multiple_records/assessment_progress_measure');
		$build_form -> set_view_or_edit_mode('add');
		$build_form -> set_panel_title('Assessment Progress Measure');
		$build_form -> set_go_back_on_post(true);
		$this -> load_view($build_form, $fields);
	}

	public function add_assessment_milestone() {

		$build_form = $this -> load_library();

		$fields[] = array('label' => 'Assessment Milestone Name:', 'element' => 'input', 'properties' => array('id' => '', 'class' => '', 'name' => 'milestone_name'));
		$milestones = $this -> db -> select(array('assessment_milestones_id', 'milestone_name')) -> get('assessment_milestones') -> result_object();
		$option = array('0' => array('option' => 'Initial Assessment'));
		foreach ($milestones as $milestone) {
			$option[$milestone -> assessment_milestones_id] = array('option' => $milestone -> milestone_name);

		}
		$fields[] = array('label' => 'Insert Milestone After', 'element' => 'select', 'properties' => array('id' => '', 'class' => '', 'name' => 'insert_after'), 'options' => $option);

		$fields[] = array('label' => 'Period Needed to Complete(in months)', 'element' => 'select', 'properties' => array('id' => '', 'class' => '', 'name' => 'assessment_period_in_days'), 'options' => array('1' => array('option' => '1'), '2' => array('option' => '2'), '3' => array('option' => '3'), '4' => array('option' => '4'), '5' => array('option' => '5'), '6' => array('option' => '6'), '7' => array('option' => '7'), '8' => array('option' => '8'), '9' => array('option' => '9'), '10' => array('option' => '10'), '11' => array('option' => '11'), '12' => array('option' => '12')));

		$fields[] = array('label' => 'Assessment Review Status', 'element' => 'input', 'properties' => array('id' => '', 'class' => '', 'name' => 'assessment_review_status'), );

		$fields[] = array('label' => 'User Customized Review Status', 'element' => 'input', 'properties' => array('id' => '', 'class' => '', 'name' => 'user_customized_review_status'), );
		$build_form -> set_view_or_edit_mode('add');
		$build_form -> set_panel_title('Add Milestone');
		$build_form -> set_form_id('frm_add_milestone');
		$build_form -> set_form_action(base_url() . 'settings/create_assessment_milestone/assessment_milestones');

		$this -> load_view($build_form, $fields, 'single_form');
	}

	public function create_assessment_milestone($table_name) {

		//insert the new record with insert of key of -1(temp key)
		$form_input = $this -> input -> post();
		$form_input['insert_after'] = -1;
		$this -> db -> trans_start();
		$this -> db -> insert($table_name, $form_input);

		//get last Id inserted
		$inserted_id = $this -> db -> insert_id();
		$insert_after_from_form = $this -> input -> post('insert_after');

		// //Update a milestone that has its insert after key = to the posted insert_after to the value the last insert id
		$this -> db -> where(array('insert_after' => $insert_after_from_form));
		$data_existing_milestone['insert_after'] = $inserted_id;
		$this -> db -> update($table_name, $data_existing_milestone);

		//Update the newly inserted record to have its insert after key=the posted insert after
		$this -> db -> where(array('assessment_milestones_id' => $inserted_id));
		$data_new_milestone['insert_after'] = $insert_after_from_form;
		$this -> db -> update($table_name, $data_new_milestone);

		echo $this -> db -> trans_complete() ? 1 : 0;
	}

	function single_form_edit($table_name,$primary_key){
		
		$array_of_fields_schema = $this->db->field_data($table_name);
			
		$field_names = array_column($array_of_fields_schema, 'name');
		$primary_keys_array = array_column($array_of_fields_schema, 'primary_key');
			
		$field_keys = array_combine($field_names, $primary_keys_array);
			
		$primary_key_field = array_search(1, $field_keys);
		
		$this->db->where(array($primary_key_field=>$primary_key));
		
		$this->db->update($table_name,$this->input->post());
		
		echo json_encode($this->input->post());
		
		
	}

	public function create_new_single_record($table_name) {
		$form_input = $this -> input -> post();

		if ($this -> db -> insert($table_name, $form_input)) {
			echo true;
		} else {
			echo false;
		}
	}

	public function create_new_multiple_records($table_name) {
		$form_input = $this -> input -> post();
		$build_final_post = array();
		foreach ($form_input as $field_name => $field_values_array) {
			$i = 0;
			foreach ($field_values_array as $field_values) {

				$build_final_post[$i][$field_name] = $field_values;
				$i++;
			}

		}
		
		$this -> db -> insert_batch($table_name, $build_final_post);
		
		if($table_name == 'lead_bio_fields'){
			$this->add_leads_bio_information_fields($build_final_post);
		}
		
		echo "Success";
		
	}
	
	private function add_leads_bio_information_fields($columns){
		$this -> load -> dbforge();
				
		// $datatypes = $this->db->get('datatype')->result_object();
// 			
		// $datatype_key = array_column($datatypes, 'datatype_id');
		// $datatype_name = array_column($datatypes, 'sql_datatype');
// 			
		// $sql_datatypearray_combine($datatype_key, $datatype_name);
		
		foreach($columns as $column){
			
			$table_column_name = strtolower(str_replace(" ", "_", $column['lead_bio_fields_name']));
				
			$fields = array($table_column_name => array('type' => 'LONGTEXT'));
			$this -> dbforge -> add_column('leads_bio_information', $fields);
		}
		
	}
	
	private function load_view($build_form, $fields, $form_type = 'multi_form') {

		$build_form -> set_form_fields($fields);

		$page_data['output'] = $build_form -> render_form($form_type);
		$page_data['page_name'] = 'assessment_settings';
		$page_data['view_type'] = "settings";
		$page_data['page_title'] = get_phrase('assessment_settings');
		$this -> load -> view('backend/index', $page_data);
	}

	function view_single_lead_bio($table_name, $record_id) {
		$build_form = $this -> load_library();

		$selected_columns = array("Field Name" => "lead_bio_fields_name", 'Data Type' => "datatype_name", "Is Field Unique?" => "is_field_unique", "Is Field Null?" => "is_field_null", 'Default Value' => 'default_value');

		$build_form -> set_selected_fields($selected_columns, 'lead_bio_fields_id');

		$join_array = array('datatype' => array('lead_bio_fields.datatype_id', 'datatype.datatype_id'));

		$build_form -> set_table_join($join_array);

		$build_form -> set_view_or_edit_mode('view');

		$build_form -> set_panel_title('View Leads Bio Field');

		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}

	public function view_single_assessment_milestones($table_name, $record_id) {

		$build_form = $this -> load_library();

		$selected_columns = array("Milestone Name" => "milestone_name", 'When' => "assessment_period_in_days", "Review Status" => "assessment_review_status", "User Customized Review Status" => "user_customized_review_status");

		$build_form -> set_selected_fields($selected_columns, "assessment_milestones_id");

		$build_form -> set_selected_fields($selected_columns, "assessment_milestones_id");

		//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));

		//$build_form->set_table_join($join_array);

		$build_form -> set_view_or_edit_mode('view');

		$build_form -> set_panel_title("Assessment Milestone Details");

		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}

	public function view_single_connect_progress_measure($table_name, $record_id) {
		$build_form = $this -> load_library();

		$selected_columns = array("Lead Score Criteria Parameter" => "lead_score_parameter", 'Lead Score Stage' => "lead_score_stage");

		$build_form -> set_selected_fields($selected_columns, "compassion_connect_mapping_id");

		//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));

		//$build_form->set_table_join($join_array);

		$build_form -> set_view_or_edit_mode('view');

		$build_form -> set_panel_title('View Progress Measure');

		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}

	public function view_single_assessment_progress_measure($table_name, $record_id) {
		$build_form = $this -> load_library();

		$selected_columns = array("Progress Measure" => "Progress_Measure_title", 'Tools Of Verification' => "verification_tool", "Method of Assessment" => "assessment_method", "Progress Measure Weight" => "weight", "CC Mapping" => "compassion_connect_mapping");

		$build_form -> set_selected_fields($selected_columns, "assessment_progress_measure_id");

		//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));

		//$build_form->set_table_join($join_array);

		$build_form -> set_view_or_edit_mode('view');

		$build_form -> set_panel_title('View Progress Measure');

		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}

	public function add_lead_bio_fields() {
		//$output = $this->uri->segment(1);
		$build_form = $this -> load_library();

		$fields[] = array('label' => 'Field Name', 'element' => 'input', 'properties' => array('id' => '', 'class' => '', 'required' => 'required', 'name' => 'lead_bio_fields_name[]'));

		$datatypes = $this->db->get('datatype')->result_object();
		
		$datatype_array = array();
		
		foreach($datatypes as $datatype){
			$datatype_array[$datatype->datatype_id]['option'] =  ucfirst($datatype->datatype_name);
		}

		$fields[] = array('label' => 'Data Type', 'element' => 'select', 
		'properties' => array('id' => '', 'class' => '', 'required' => 'required', 
		'name' => 'datatype_id[]'), 'options' => $datatype_array);

		$yes_nos = $this->db->get('yes_no_option')->result_object();
		
		$yes_no_options = array();
		
		foreach($yes_nos as $yes_no){
			$yes_no_options[$yes_no->yes_no_option_key]['option'] = $yes_no->yes_no_option_name;
		}
		
		$yes_no_options[0]['properties']['selected'] = 'selected';
		
		$fields[] = array('label' => 'Field Unique?', 'element' => 'select', 'properties' => array('id' => '', 'class' => '', 'name' => 'is_field_unique[]'), 'options' => $yes_no_options);

		$fields[] = array('label' => 'Optional?', 'element' => 'select', 'properties' => array('id' => '', 'class' => 'is_field_null', 'name' => 'is_field_null[]'), 'options' => $yes_no_options);

		$fields[] = array('label' => 'Default Value', 'element' => 'input', 'properties' => array('id' => '', 'class' => 'default_value', 'name' => 'default_value[]'));
		
		$fields[] = array('label' => 'Show Field?', 'element' => 'select', 'properties' => array('id' => '', 'class' => '', 'name' => 'show_field[]'), 'options' => $yes_no_options);
		
		
		$build_form -> set_view_or_edit_mode('add');
		$build_form -> set_panel_title('Leads Bio Fields');
		$build_form -> set_form_id('frm_bio');
		$build_form -> set_form_action(base_url() . 'settings/create_new_multiple_records/lead_bio_fields');

		$this -> load_view($build_form, $fields);		

	}

	public function edit_assessment_progress_measure($table_name, $record_id) {
		$build_form = $this -> load_library();

		$selected_columns = array("Progress Measure" => "Progress_Measure_title", 'Tools Of Verification' => "verification_tool", "Method of Assessment" => "assessment_method", "Progress Measure Weight" => "weight", "CC Mapping" => "compassion_connect_mapping");

		$build_form -> set_selected_fields($selected_columns, "assessment_progress_measure_id");

		$build_form -> set_view_or_edit_mode('edit');

		$build_form -> set_panel_title('Edit Progress Measure');
		
		$weight_ranges = range(1, 10);
		
		$weight = array();
		
		foreach($weight_ranges as $weight_range){
			$weight[$weight_range]['option'] = $weight_range;
		}
		
		$build_form -> set_dropdown_element_type(array('weight', $weight));

		$compassion_connect_mapping = $this -> db -> select(array('compassion_connect_mapping_id', 'lead_score_parameter')) -> get('compassion_connect_mapping') -> result_object();
		$option = array();
		foreach ($compassion_connect_mapping as $mapping) {
			$option[$mapping -> compassion_connect_mapping_id] = array('option' => $mapping -> lead_score_parameter);

		}

		$build_form -> set_dropdown_element_type(array('compassion_connect_mapping', $option));

		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}

	public function edit_lead_bio_fields($table_name, $record_id) {
		$build_form = $this -> load_library();

		$selected_columns = array("Field Name" => "lead_bio_fields.lead_bio_fields_name", 'Data Type' => "lead_bio_fields.datatype_id", "Is Field Unique?" => "lead_bio_fields.is_field_unique", "Is Field Null?" => "lead_bio_fields.is_field_null", 'Default Value' => 'lead_bio_fields.default_value');

		$build_form -> set_selected_fields($selected_columns, 'lead_bio_fields_id');

		$join_array = array('datatype' => array('lead_bio_fields.datatype_id', 'datatype.datatype_id'));

		$build_form -> set_table_join($join_array);

		$build_form -> set_view_or_edit_mode('edit');

		$build_form -> set_panel_title('Edit Leads Bio Field');
		
		$yes_nos = $this->db->get('yes_no_option')->result_object();
		
		$yes_no_options = array();
		
		foreach($yes_nos as $yes_no){
			$yes_no_options[$yes_no->yes_no_option_key]['option'] = $yes_no->yes_no_option_name;
		}
		
		$build_form -> set_dropdown_element_type(array('is_field_unique', $yes_no_options));

		
		$build_form -> set_dropdown_element_type(array('is_field_null', $yes_no_options));
		
		$datatype = $this->db->get('datatype')->result_object();
		
		$data_types_array = array(); 
		
		foreach($datatype as $type){
			$data_types_array[$type->datatype_id] = array('option' => $type->datatype_name);
		}
		
				
		$build_form -> set_dropdown_element_type(array('datatype_id', $data_types_array));
		
		
		
		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}

	public function edit_assessment_milestone($table_name, $record_id) {
		$build_form = $this -> load_library();

		$selected_columns = array("Milestone Name" => "milestone_name", 'Insert After' => 'insert_after', 'When' => "assessment_period_in_days", "Review Status" => "assessment_review_status", "User Customized Review Status" => "user_customized_review_status");

		$milestones = $this -> db -> select(array('assessment_milestones_id', 'milestone_name')) -> get('assessment_milestones') -> result_object();
		$option = array('0' => array('option' => 'Initial Assessment'));
		foreach ($milestones as $milestone) {
			$option[$milestone -> assessment_milestones_id] = array('option' => $milestone -> milestone_name);

		}
		$build_form -> set_dropdown_element_type(array('insert_after', $option));
		
		$months =  range(1,12);
		
		$months_options = array();
		
		foreach($months as $month){
			$months_options[$month] = array('option'=>$month);
		}
		
		$build_form -> set_dropdown_element_type(array('assessment_period_in_days', $months_options));

		$build_form -> set_selected_fields($selected_columns, "assessment_milestones_id");

		$build_form -> set_view_or_edit_mode('edit');

		$build_form -> set_panel_title('Edit Assessment Milestone');

		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}

	public function edit_connect_progress_measure($table_name, $record_id) {
		$build_form = $this -> load_library();

		$selected_columns = array("Lead Score Criteria Parameter" => "lead_score_parameter", 'Lead Score Stage' => "lead_score_stage");

		$build_form -> set_selected_fields($selected_columns, "compassion_connect_mapping_id");

		//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));

		//$build_form->set_table_join($join_array);

		$build_form -> set_view_or_edit_mode('edit');

		$build_form -> set_panel_title('Edit Connect Progress Measure');

		$lead_score_stage = $this -> db -> get_where('compassion_connect_mapping', array('compassion_connect_mapping_id' => $record_id)) -> row() -> lead_score_stage;

		//To be drawn drawn from a leads stages table to created which provide foregin to 'compassion_connect_mapping' field 'lead_score_stage'
		$select_list_options = array('1' => 'Stage 1', '2' => 'Stage 2');

		$this -> build_select_options_from_database($build_form, 'lead_score_stage', $lead_score_stage, $select_list_options);

		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}

	function build_select_options_from_database($build_form, $column_name, $selected_record_database_table_key, $select_list_options) {
		$options = array();

		foreach ($select_list_options as $select_list_key => $select_list_value) {
			if ($selected_record_database_table_key == $select_list_key) {
				$options[$select_list_key] = array('option' => $select_list_value, 'selected' => 'selected');

			} else {
				$options[$select_list_key] = array('option' => $select_list_value);
			}

		}

		$build_form -> set_dropdown_element_type(array($column_name, $options));
	}

	private function view_record_by_id($build_form, $table_name, $record_id) {
		$build_form -> set_debug_mode(2);
		$build_form -> set_where_clause(array($table_name . "_id" => $record_id));

		$build_form -> set_db_table($table_name);

		//$build_form->set_hide_save_button($display_save_btn);
		
		$build_form -> set_form_action(base_url() . 'settings/single_form_edit/'.$table_name.'/'.$record_id);

		$page_data['output'] = $build_form -> render_form('single_view_form');
		$page_data['view_type'] = "settings";
		$page_data['page_name'] = "assessment_settings";
		$page_data['page_title'] = get_phrase("assessment_settings");
		$this -> load -> view('backend/index', $page_data);
	}

	/*****SITE/SYSTEM SETTINGS*********/
	function system_settings($param1 = '', $param2 = '', $param3 = '') {
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');

		if ($param1 == 'do_update') {

			$data['description'] = $this -> input -> post('system_name');
			$this -> db -> where('type', 'system_name');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('system_title');
			$this -> db -> where('type', 'system_title');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('address');
			$this -> db -> where('type', 'address');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('phone');
			$this -> db -> where('type', 'phone');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('system_email');
			$this -> db -> where('type', 'system_email');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('system_name');
			$this -> db -> where('type', 'system_name');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('language');
			$this -> db -> where('type', 'language');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('text_align');
			$this -> db -> where('type', 'text_align');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('sidebar-collapsed');
			$this -> db -> where('type', 'sidebar-collapsed');
			$this -> db -> update('settings', $data);

			$this -> session -> set_flashdata('flash_message', get_phrase('data_updated'));
			redirect(base_url() . 'settings/system_settings/', 'refresh');
		}
		if ($param1 == 'upload_logo') {
			move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/logo.png');
			$this -> session -> set_flashdata('flash_message', get_phrase('settings_updated'));
			redirect(base_url() . 'settings/system_settings/', 'refresh');
		}
		if ($param1 == 'change_skin') {
			$data['description'] = $param2;
			$this -> db -> where('type', 'skin_colour');
			$this -> db -> update('settings', $data);
			$this -> session -> set_flashdata('flash_message', get_phrase('theme_selected'));
			redirect(base_url() . 'settings/system_settings/', 'refresh');
		}

		$page_data['page_name'] = 'system_settings';
		$page_data['view_type'] = 'settings';
		$page_data['page_title'] = get_phrase('system_settings');
		$page_data['settings'] = $this -> db -> get('settings') -> result_array();
		$this -> load -> view('backend/index', $page_data);
	}

	/*****SMS SETTINGS*********/
	function sms_settings($param1 = '', $param2 = '') {
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		if ($param1 == 'clickatell') {

			$data['description'] = $this -> input -> post('clickatell_user');
			$this -> db -> where('type', 'clickatell_user');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('clickatell_password');
			$this -> db -> where('type', 'clickatell_password');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('clickatell_api_id');
			$this -> db -> where('type', 'clickatell_api_id');
			$this -> db -> update('settings', $data);

			$this -> session -> set_flashdata('flash_message', get_phrase('data_updated'));
			redirect(base_url() . 'index.php?settings/sms_settings/', 'refresh');
		}

		if ($param1 == 'twilio') {

			$data['description'] = $this -> input -> post('twilio_account_sid');
			$this -> db -> where('type', 'twilio_account_sid');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('twilio_auth_token');
			$this -> db -> where('type', 'twilio_auth_token');
			$this -> db -> update('settings', $data);

			$data['description'] = $this -> input -> post('twilio_sender_phone_number');
			$this -> db -> where('type', 'twilio_sender_phone_number');
			$this -> db -> update('settings', $data);

			$this -> session -> set_flashdata('flash_message', get_phrase('data_updated'));
			redirect(base_url() . 'index.php?settings/sms_settings/', 'refresh');
		}

		if ($param1 == 'active_service') {

			$data['description'] = $this -> input -> post('active_sms_service');
			$this -> db -> where('type', 'active_sms_service');
			$this -> db -> update('settings', $data);

			$this -> session -> set_flashdata('flash_message', get_phrase('data_updated'));
			redirect(base_url() . 'index.php?settings/sms_settings/', 'refresh');
		}

		$page_data['page_name'] = 'sms_settings';
		$page_data['view_type'] = 'settings';
		$page_data['page_title'] = get_phrase('sms_settings');
		$page_data['settings'] = $this -> db -> get('settings') -> result_array();
		$this -> load -> view('backend/index', $page_data);
	}

	/*****LANGUAGE SETTINGS*********/
	function manage_language($param1 = '', $param2 = '', $param3 = '') {
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'login', 'refresh');

		if ($param1 == 'edit_phrase') {
			$page_data['edit_profile'] = $param2;
		}
		if ($param1 == 'update_phrase') {
			$language = $param2;
			$total_phrase = $this -> input -> post('total_phrase');
			for ($i = 1; $i < $total_phrase; $i++) {
				//$data[$language]	=	$this->input->post('phrase').$i;
				$this -> db -> where('phrase_id', $i);
				$this -> db -> update('language', array($language => $this -> input -> post('phrase' . $i)));
			}
			redirect(base_url() . 'settings/manage_language/edit_phrase/' . $language, 'refresh');
		}
		if ($param1 == 'do_update') {
			$language = $this -> input -> post('language');
			$data[$language] = $this -> input -> post('phrase');
			$this -> db -> where('phrase_id', $param2);
			$this -> db -> update('language', $data);
			$this -> session -> set_flashdata('flash_message', get_phrase('settings_updated'));
			redirect(base_url() . 'settings/manage_language/', 'refresh');
		}
		if ($param1 == 'add_phrase') {
			$data['phrase'] = $this -> input -> post('phrase');
			$this -> db -> insert('language', $data);
			$this -> session -> set_flashdata('flash_message', get_phrase('settings_updated'));
			redirect(base_url() . 'settings/manage_language/', 'refresh');
		}
		if ($param1 == 'add_language') {
			$language = $this -> input -> post('language');
			$this -> load -> dbforge();
			$fields = array($language => array('type' => 'LONGTEXT'));
			$this -> dbforge -> add_column('language', $fields);

			$this -> session -> set_flashdata('flash_message', get_phrase('settings_updated'));
			redirect(base_url() . 'settings/manage_language/', 'refresh');
		}
		if ($param1 == 'delete_language') {
			$language = $param2;
			$this -> load -> dbforge();
			$this -> dbforge -> drop_column('language', $language);
			$this -> session -> set_flashdata('flash_message', get_phrase('settings_updated'));

			redirect(base_url() . 'settings/manage_language/', 'refresh');
		}
		$page_data['page_name'] = 'manage_language';
		$page_data['view_type'] = 'settings';
		$page_data['page_title'] = get_phrase('manage_language');
		//$page_data['language_phrases'] = $this->db->get('language')->result_array();
		$this -> load -> view('backend/index', $page_data);
	}

	function expense_category($param1 = '', $param2 = '') {
		if ($this -> session -> userdata('user_login') != 1)
			redirect('login', 'refresh');
		if ($param1 == 'create') {
			$data['name'] = $this -> input -> post('name');
			$data['income_category_id'] = $this -> input -> post('income_category_id');
			$this -> db -> insert('expense_category', $data);
			$this -> session -> set_flashdata('flash_message', get_phrase('data_added_successfully'));
			redirect(base_url() . 'index.php?settings/school_settings');
		}
		if ($param1 == 'edit') {
			$data['name'] = $this -> input -> post('name');
			$data['income_category_id'] = $this -> input -> post('income_category_id');
			$this -> db -> where('expense_category_id', $param2);
			$this -> db -> update('expense_category', $data);
			$this -> session -> set_flashdata('flash_message', get_phrase('data_updated'));
			redirect(base_url() . 'index.php?settings/school_settings');
		}
		if ($param1 == 'delete') {
			$this -> db -> where('expense_category_id', $param2);
			$this -> db -> delete('expense_category');
			$this -> session -> set_flashdata('flash_message', get_phrase('data_deleted'));
			redirect(base_url() . 'index.php?settings/school_settings');
		}

		$page_data['page_name'] = 'school_settings';
		$page_data['view_type'] = 'settings';
		$page_data['page_title'] = get_phrase('school_settings');
		$this -> load -> view('backend/index', $page_data);
	}

	function income_category($param1 = '', $param2 = '') {
		if ($this -> session -> userdata('user_login') != 1)
			redirect('login', 'refresh');

		if ($param1 == 'create') {
			$data['name'] = $this -> input -> post('name');
			$data['opening_balance'] = $this -> input -> post('opening_balance');
			$this -> db -> insert('income_categories', $data);
			$this -> session -> set_flashdata('flash_message', get_phrase('data_added_successfully'));
			redirect(base_url() . 'index.php?settings/income_category');
		}
		if ($param1 == 'edit') {
			$data['name'] = $this -> input -> post('name');
			$data['opening_balance'] = $this -> input -> post('opening_balance');
			//$data['income_category_id'] = $this->input->post('income_category_id');
			$this -> db -> where('income_category_id', $param2);
			$this -> db -> update('income_categories', $data);
			$this -> session -> set_flashdata('flash_message', get_phrase('data_updated'));
			redirect(base_url() . 'index.php?settings/income_category');
		}
		if ($param1 == 'delete') {
			$this -> db -> where('income_category_id', $param2);
			$this -> db -> delete('income_categories');
			$this -> session -> set_flashdata('flash_message', get_phrase('data_deleted'));
			redirect(base_url() . 'index.php?settings/income_category');
		}

		$page_data['page_name'] = 'school_settings';
		$page_data['view_type'] = 'settings';
		$page_data['page_title'] = get_phrase('income_category');
		$this -> load -> view('backend/index', $page_data);
	}

	function update_income_category_opening_balance($income_category_id = "") {
		$this -> db -> where(array('income_category_id' => $income_category_id));
		$data['opening_balance'] = $this -> input -> post('opening_balance');
		$this -> db -> update('income_categories', $data);
	}

	function opening_balances($param1 = "", $param2 = "") {

		$this -> db -> where(array('name' => 'cash'));
		$data['opening_balance'] = $this -> input -> post('cash');
		$this -> db -> update('accounts', $data);

		$this -> db -> where(array('name' => 'bank'));
		$data1['opening_balance'] = $this -> input -> post('bank');
		$this -> db -> update('accounts', $data1);

		$this -> db -> where(array('type' => 'system_start_date'));
		$data2['description'] = $this -> input -> post('system_start_date');
		$this -> db -> update('settings', $data2);

		$this -> session -> set_flashdata('flash_message', get_phrase('data_added_successfully'));
		redirect(base_url() . 'index.php?settings/school_settings/', 'refresh');
	}

	function user_profiles($param1 = '', $param2 = '') {
		if ($this -> session -> userdata('user_login') != 1)
			redirect('login', 'refresh');

		if ($param1 == "create") {

			$msg = get_phrase('failure');

			$data['name'] = $this -> input -> post('name');
			$data['description'] = $this -> input -> post('description');
			//$data['visibility'] = $this->input->post('visibility');

			$this -> db -> insert("profile", $data);

			if ($this -> db -> affected_rows() > 0) {
				$msg = get_phrase('success');
			}

			$this -> session -> set_flashdata('flash_message', $msg);
			redirect(base_url() . 'settings/user_profiles/', 'refresh');
		}

		$page_data['page_name'] = 'user_profiles';
		$page_data['view_type'] = 'settings';
		$page_data['page_title'] = get_phrase('user_profiles');
		$this -> load -> view('backend/index', $page_data);
	}

	function entitlement($param1 = "", $param2 = "") {
		if ($this -> session -> userdata('user_login') != 1)
			redirect('login', 'refresh');

		$page_data['page_name'] = 'entitlement';
		$page_data['profile_id'] = $param1;
		$page_data['view_type'] = 'settings';
		$page_data['page_title'] = get_phrase('entitlement');
		$this -> load -> view('backend/index', $page_data);
	}

	function update_entitlement($param1 = "", $param2 = "", $param3 = "") {

		if ($param3 === 'true') {
			$data['entitlement_id'] = $param1;
			$data['profile_id'] = $param2;
			$this -> db -> insert("access", $data);
		} else {
			$this -> db -> where(array("entitlement_id" => $param1, "profile_id" => $param2));
			$this -> db -> delete("access");
		}

		//echo "Update Successful";
	}

	function promote_to_user($param1 = "", $param2 = "") {
		if ($param1 == "teacher") {
			$teacher = $this -> db -> get_where("teacher", array("teacher_id" => $param2)) -> result_array();
			extract($teacher[0]);

			$name_array = explode(" ", $name);

			$data['firstname'] = array_shift($name_array);
			$data['lastname'] = implode(" ", $name_array);
			$data['email'] = $email;
			$data['password'] = "default";
			$data['phone'] = $phone;
			$data['login_type_id'] = $this -> db -> get_where("login_type", array("name" => "teacher")) -> row() -> login_type_id;
			$data['profile_id'] = 0;
			$data['type_user_id'] = $teacher_id;
			$data['auth'] = 1;

			$msg = get_phrase("failed");

			/**Check if exists**/
			$exists = $this -> db -> get_where("user", array("email" => $email)) -> num_rows();
			if ($exists == 0) {
				$this -> db -> insert("user", $data);
				$msg = get_phrase("success");
			}

			$this -> session -> set_flashdata('flash_message', $msg);
			redirect(base_url() . 'index.php?teacher/teacher/', 'refresh');
		}

		if ($param1 == "admin") {
			$admin = $this -> db -> get_where("admin", array("admin_id" => $param2)) -> result_array();
			extract($admin[0]);

			$name_array = explode(" ", $name);

			$data['firstname'] = array_shift($name_array);
			$data['lastname'] = implode(" ", $name_array);
			$data['email'] = $email;
			$data['password'] = "default";
			$data['phone'] = $phone;
			$data['login_type_id'] = $this -> db -> get_where("login_type", array("name" => "admin")) -> row() -> login_type_id;
			$data['profile_id'] = 0;
			$data['type_user_id'] = $admin_id;
			$data['auth'] = 1;

			$msg = get_phrase("failed");

			/**Check if exists**/
			$exists = $this -> db -> get_where("user", array("email" => $email)) -> num_rows();
			if ($exists == 0) {
				$this -> db -> insert("user", $data);
				$msg = get_phrase("success");
			}

			$this -> session -> set_flashdata('flash_message', $msg);
			redirect(base_url() . 'index.php?admin/admin/', 'refresh');
		}

	}

}
