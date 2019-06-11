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

	/** ASSESSMENT SETTINGS **/
	
	public function assessment_milestone(){
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$lib = $this->load_library();
		
		$lib->set_db_table('assessment_milestone');
		
		$lib->set_dropdown_from_table(array('assessment_milestone','assessment_milestone_id','assessment_milestone_name','insert_after'));
		
		$lib->set_dropdown_from_range(array('assessment_period_in_days',1, 180));
		
		$lib->set_debug_mode(2);
		/** Render the utility views to the codeigniter view array output **/
		$page_data['output'] = $lib->render();
		
		//This is non utility lib implementation
		$page_data['page_name'] = 'assessment_settings';
		$page_data['view_type'] = 'settings';
		$page_data['page_title'] = get_phrase('assessment_settings');
		$this -> load -> view('backend/index', $page_data);
	}
	
	function leads_bio_field(){
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');
		
		$lib = $this->load_library();
		
		$lib->set_debug_mode(2);
		
		//The primary table to list its records from
		$lib->set_db_table('leads_bio_field');
		
		//Setting up yes/no option select tag						
		//Can be done per individual fields and in this case no array is passed but the field as a string
		 
		$lib->set_dropdown_yes_no(array('is_field_null','show_field','is_suspended','is_field_unique'));						
		
		//Setting up table relationshps
		
		$lib->set_table_join(array(	'datatype'=>array('datatype_id','datatype_id')));
		
		/** Table listing view depandant settings **/
		
		//Fields to show on the table listing
		$lib->set_fields_to_show(array(
										'leads_bio_field_name',
										'datatype_name',
										'is_field_unique',
										'is_field_null',
										'default_value',
										'show_field',
										'is_suspended'
										)
									);
									
		$lib->set_fields_to_show_on_add(array(
										'leads_bio_field_name',
										'datatype_name',
										'is_field_unique',
										'is_field_null',
										'default_value',
										'show_field',
										'is_suspended'
										)
									);							
		

		$lib->set_fields_to_show_on_edit(array(
										'leads_bio_field_name',
										'datatype_name',
										'is_field_unique',
										'is_field_null',
										'default_value',
										'show_field',
										'is_suspended'
										)
									);	
									
		$lib->set_fields_to_show_on_view(array(
										'leads_bio_field_name',
										'datatype_name',
										'is_field_unique',
										'is_field_null',
										'default_value',
										'show_field',
										'is_suspended'
										)
									);	
									
		$lib->set_add_form_type('multi_column');																
		
		/** Render the utility views to the codeigniter view array output **/
		$page_data['output'] = $lib->render();
		
		//This is non utility lib implementation
		$page_data['page_name'] = 'assessment_settings';
		$page_data['view_type'] = 'settings';
		$page_data['page_title'] = get_phrase('assessment_settings');
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


}
