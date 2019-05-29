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
	
	public function leads_information($method = "view_leads_bio_information", $status = 'active'){
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');

		$page_data['output'] = $this->$method($status);

		$page_data['page_name'] = 'leads_information';
		$page_data['view_type'] = "leads";
		$page_data['page_title'] = get_phrase('leads_information');
		$this -> load -> view('backend/index', $page_data);
	}
	
	private function view_leads_bio_information($status){
		
		$build_list = $this -> load_library();

		$build_list -> set_panel_title("Lead Bio Information");

		$action = array('add' => array('href' => 'leads/add_lead_bio_information'), 'view' => array('href' => 'leads/view_lead_bio_information'), 'edit' => array('href' => 'leads/edit_lead_bio_information'), 'delete' => array('href' => 'leads/delete_lead_bio_information'));

		$build_list -> set_list_action($action);
		
		$build_list -> set_db_table("leads_bio_information");

		$build_list -> set_add_form();
		
		$not_to_show_object = $this->db->select(array('lead_bio_info_column'))->get_where('lead_bio_fields',
			array('show_field'=>0))->result_object();
			
		$hidden_fields = array_column($not_to_show_object,'lead_bio_info_column');
		
		
		$build_list->set_hidden_fields($hidden_fields);
		
				$extra_action[] = array(
				'href'=> 'leads/assess_lead',
				'label'=>'Assess Lead',
				'icon' => 'book'
		);
		
		$build_list->set_extra_list_action($extra_action);
		

		return $build_list -> render_item_list();
	}

	function add_lead_bio_information(){

		$build_form = $this -> load_library();
		
		$leads_bio_information_fields = $this->db->field_data('leads_bio_information');
		
		array_shift($leads_bio_information_fields);
		
		$lead_bio_fields = array_column($leads_bio_information_fields,'name');
		
		foreach($lead_bio_fields as $lead_bio_field){
			$fields[] = array('label' => $lead_bio_field, 'element' => 'input', 'properties' => array('id' => '', 'class' => '', 'name' => 'lead_name'));	
		}
		
		$build_form->set_extra_list_action($extra_action);
			
		$build_form -> set_view_or_edit_mode('add');
		$build_form -> set_panel_title('Add Lead Bio Information');
		$build_form -> set_form_id('frm_add_lead_bio_information');
		$build_form -> set_form_action(base_url() . 'leads/create_new_lead/');
		
		$this -> load_view($build_form,$fields ,'single_form');
	}

	function create_new_lead(){
		
	}
	
	private function load_view($build_form,$fields ,$form_type = 'multi_form') {
		
		$build_form -> set_form_fields($fields);

		$page_data['output'] = $build_form -> render_form($form_type);
		$page_data['page_name'] = 'leads_information';
		$page_data['view_type'] = "leads";
		$page_data['page_title'] = get_phrase('lead_bio_information');
		$this -> load -> view('backend/index', $page_data);
	}
	
}	