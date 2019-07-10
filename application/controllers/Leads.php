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
		$this -> load -> library('grocery_CRUD');

		/*cache control*/
		$this -> output -> set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this -> output -> set_header('Pragma: no-cache');
	}

	function active_leads_information() {
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');

		$crud = new grocery_CRUD();
		$crud -> set_theme('tablestrap');
		$crud -> set_table('leads_bio_information');
		
		$status = 'Active';
		
		//Status filter
		$crud->where(array('lead_status'=>$status));
		
		//Dropdown Status
		$crud->field_type('lead_status', 'dropdown',array('Active'=>'Active','Closed'=>'Closed'));
		
		//Relationship
		$crud->set_relation('assessment_milestones_id', 'assessment_milestones', 'milestone_name');
		
		//Display in Human Readable
		$crud->display_as('assessment_id',get_phrase('assessment'));
		
		//Unset delete and Edit
		$crud -> unset_delete();
		
		//Add a leads assessment action button
		$crud->add_action(get_phrase('assess_lead'), '', 'leads/lead_assessment', 'fa-book');

		$output = $crud -> render();
		$page_data['page_name'] = 'leads_information';
		$page_data['view_type'] = 'leads';
		$page_data['page_title'] = get_phrase('leads_bio_information')." : ".get_phrase($status);
		$output = array_merge($page_data, (array)$output);

		$this -> load -> view('backend/index', $output);
	}

	function closed_leads_information() {
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');

		$crud = new grocery_CRUD();
		$crud -> set_theme('tablestrap');
		$crud -> set_table('leads_bio_information');
		
		$status = 'Closed';
		
		//Status filter
		$crud->where(array('lead_status'=>$status));
		
		//Dropdown Status
		$crud->field_type('lead_status', 'dropdown',array('Active'=>'Active','Closed'=>'Closed'));
		
		//Relationship
		$crud->set_relation('assessment_milestones_id', 'assessment_milestones', 'milestone_name');
		
		//Display in Human Readable
		$crud->display_as('assessment_id',get_phrase('assessment'));
		
		//Unset delete and Edit
		$crud -> unset_delete();
		$crud->unset_add();
		$crud->unset_edit();
		
		$output = $crud -> render();
		$page_data['page_name'] = 'leads_information';
		$page_data['view_type'] = 'leads';
		$page_data['page_title'] = get_phrase('leads_bio_information')." : ".get_phrase($status);
		$output = array_merge($page_data, (array)$output);

		$this -> load -> view('backend/index', $output);
	}
	
	function lead_assessment(){
		
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$page_data['page_name'] = 'lead_assessment';
		$page_data['view_type'] = 'leads';
		$page_data['page_title'] = get_phrase('lead_assessment');
		$this -> load -> view('backend/index', $page_data);
	}
	

}
