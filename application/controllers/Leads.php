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

class Leads extends CI_Controller {

	function __construct() {
		parent::__construct();
		$this -> load -> database();
		$this -> load -> library('session');
		$this -> session -> set_userdata('view_type', 'leads');

		/*cache control*/
		$this -> output -> set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this -> output -> set_header('Pragma: no-cache');
	}

	private function load_library() {
		$this -> load -> library('utility_forms');
		return new Utility_forms();
	}

	public function leads_information($method = "view_leads_bio_information", $status = 'active') {
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');

		$page_data['output'] = $this -> $method($status);

		$page_data['page_name'] = 'leads_information';
		$page_data['view_type'] = "leads";
		$page_data['page_title'] = get_phrase('leads_information');
		$this -> load -> view('backend/index', $page_data);
	}

	private function view_leads_bio_information($status) {
		
		$this->check_add_if_leads_information_default_fields_exists();

		$build_list = $this -> load_library();

		$build_list -> set_panel_title("Lead Bio Information");

		//$build_list->set_hidden_fields(array('address'));

		$action = array('add' => array('href' => 'leads/add_lead_bio_information'), 'view' => array('href' => 'leads/view_sigle_lead_bio_information'), 'edit' => array('href' => 'leads/edit_lead_bio_information'), 'delete' => array('href' => 'leads/delete_lead_bio_information'));

		$build_list -> set_list_action($action);
		
		$extra_action= array();
		
		//check if the leads are active or in active
		if($status=='closed'){
			
			$build_list -> set_where_clause(array("lead_status" => 'Closed'));
			
			$extra_action[]=array('href' => 'leads/reopen_lead', 'label' => 'Reopen Lead', 'icon' => 'book');
				   
		}else{
			$build_list -> set_where_clause(array("lead_status" => 'Active'));
			
			$extra_action[]=array('href' => 'leads/lead_asessment', 'label' => 'Assess Lead', 'icon' => 'book');
		}
		
		$build_list -> set_extra_list_action($extra_action);
		
		$build_list -> set_db_table("leads_bio_information");

		$build_list -> set_add_form();

		//Get fields to hide
		$fields_to_hide =$this->return_fields_to_hide();

		//add assessment_id column to the $hidden_fields and hide it from view
		//array_push($hidden_fields, 'assessment_id');

		$build_list -> set_hidden_fields($fields_to_hide);

		
		
		$build_list -> set_replace_field_value(array('assessment_id' => $this -> crud_model -> get_insert_after_milestone()));
		

		return $build_list -> render_item_list();
	}
	
	private function check_add_if_leads_information_default_fields_exists(){
			
		$this -> load -> dbforge();
		
		$required_fields = array('lead_status'=>1,'assessment_id'=>2);
		
		$varchar='VARCHAR';
		$number='INT';
		
		
		//Defence code added
		foreach($required_fields as $required_field=>$datatype){
			   if(!$this -> db -> field_exists($required_field, 'leads_bio_information'))
			{
				//Check if text, then use VARCHAR
				if($datatype==1)
				{
				  //$fields = array($table_column_name => array('type' =>$varchar ,'constraint'=>'30'));
				
			      $this -> dbforge -> add_column('leads_bio_information', 
			                  array($required_field => array(
			                  'type' =>$varchar ,
			                  'constraint'=>'30',
							  'NULL'=>TRUE)));	
				}
				//Check if number , then use INT
                if($datatype==2)
				{
					 $this -> dbforge -> add_column('leads_bio_information', 
			                  array($required_field => array(
			                  'type' =>$number ,
			                  'constraint'=>'100',//We can include this to be passed dynamically from Leads_bio_fields
							  'NULL'=>TRUE)));
				}
			}
			
		}
		
         
	}
	
	function add_lead_bio_information() {

		$build_form = $this -> load_library();

		$build_form -> set_db_table('leads_bio_information');
		
		/*
		$assessment_milestone_options = array();//Initial assessments
		
				$assessment_milestones = $this -> db ->get("assessment_milestones") -> result_object();
		
				foreach ($assessment_milestones as $assessment_milestone) {
					$assessment_milestone_options[$assessment_milestone -> assessment_milestones_id] = array('option' => $assessment_milestone -> milestone_name);
				}
				
				$build_form->set_dropdown_element_type(array('assessment_id',$assessment_milestone_options));*/
		
		//$build_form->set_dropdown_from_table(array('leads_bio_information','leads_bio_information_id','assessment_id','assessment_id'));
		

		//Hide Id fields
		$build_form -> set_hidden_fields(array('leads_bio_information_id','lead_status', 'assessment_id'));

		$build_form -> set_view_or_edit_mode('add');
		$build_form -> set_panel_title('Create New Lead');
		$build_form -> set_form_id('frm_add_lead_bio_information');
		$build_form -> set_form_action(base_url() . 'leads/create_new_lead/leads_bio_information');

		$this -> load_view($build_form, 'single_form');
	}

	function create_new_lead($table_name) {
		
		//insert the new record with insert of key of -1(temp key)
		$form_input = $this -> input -> post();
		
		//$form_input='Active';
		
		$this -> db -> trans_start();
		
		$this -> db -> insert($table_name, $form_input);
		
		echo $this -> db -> trans_complete() ? 1 : 0;

	}

	public function edit_lead_bio_information($table_name, $record_id) {

		$build_form = $this -> load_library();

		//Get fields to hide
		$fields_to_hide =$this->return_fields_to_hide();
		
		$build_form -> set_hidden_fields($fields_to_hide);

		$build_form -> set_view_or_edit_mode('edit');

		$build_form -> set_panel_title('Edit Leads Bio Information');

		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}

	public function view_sigle_lead_bio_information($table_name, $record_id) {

		$build_form = $this -> load_library();

		//Get fields to hide
		$fields_to_hide =$this->return_fields_to_hide();
		
		array_push($fields_to_hide,'assessment_id');
		
		$build_form -> set_hidden_fields($fields_to_hide);

		$build_form -> set_view_or_edit_mode('view');

		$build_form -> set_panel_title("Leads Bio Information");

		//$build_form -> set_replace_field_value(array('insert_after' => $this -> crud_model -> get_insert_after_milestone()));

		$this -> view_record_by_id($build_form, $table_name, $record_id);
	}
	private function return_fields_to_hide(){
		
		 
				
		 $not_to_show_object = $this -> db -> select(array('lead_bio_info_column')) -> get_where('lead_bio_fields', array('show_field' => 0)) -> result_object();

		$hidden_fields = array_column($not_to_show_object, 'lead_bio_info_column');
		
		// $not_to_show_object = $this -> db -> select(array('lead_bio_info_column'))->group_start()->or_where('show_field', 0)->or_where('is_suspended', 1)->group_end() -> get('lead_bio_fields') -> result_object();
// 
		// $hidden_fields = array_column($not_to_show_object, 'lead_bio_info_column');
		
		return $hidden_fields;
	}

	private function view_record_by_id($build_form, $table_name, $record_id) {
		//$build_form -> set_debug_mode(2);
		$build_form -> set_where_clause(array($table_name . "_id" => $record_id));

		$build_form -> set_db_table($table_name);

		//$build_form->set_hide_save_button($display_save_btn);

		$build_form -> set_form_action(base_url() . 'leads/single_form_edit/' . $table_name . '/' . $record_id);

		$page_data['output'] = $build_form -> render_form('single_view_form');
		$page_data['view_type'] = "leads";
		$page_data['page_name'] = "leads_information";
		$page_data['page_title'] = get_phrase("leads_information");
		$this -> load -> view('backend/index', $page_data);
	}

	function single_form_edit($table_name, $primary_key) {

		$array_of_fields_schema = $this -> db -> field_data($table_name);

		$field_names = array_column($array_of_fields_schema, 'name');
		$primary_keys_array = array_column($array_of_fields_schema, 'primary_key');

		$field_keys = array_combine($field_names, $primary_keys_array);

		$primary_key_field = array_search(1, $field_keys);

		$this -> db -> where(array($primary_key_field => $primary_key));

		$this -> db -> update($table_name, $this -> input -> post());

		echo json_encode($this -> input -> post());

	}

	private function load_view($build_form, $form_type = 'multi_form', $fields = array()) {

		if (empty($fields)) {
			$build_form -> set_form_fields($fields);
		}

		$page_data['output'] = $build_form -> render_form($form_type);
		$page_data['page_name'] = 'leads_information';
		$page_data['view_type'] = "leads";
		$page_data['page_title'] = get_phrase('lead_bio_information');
		$this -> load -> view('backend/index', $page_data);
	}
	
	public function lead_asessment(){
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		

		$page_data['page_name'] = 'lead_assessment';
		$page_data['view_type'] = "leads";
		$page_data['page_title'] = get_phrase('lead_assessment');
		$this -> load -> view('backend/index', $page_data);		
	}

}
