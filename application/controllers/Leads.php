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
		//
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
		
		//Required Fields
		$required_array = array('lead_status');
		
		$required_fields = $this->db->get_where('lead_bio_fields',array('is_field_null'=>1));
		
		if($required_fields->num_rows() >0 ){
			$columns = array_column($required_fields->result_array(), 'lead_bio_info_column');
			$required_array = array_merge($required_array,$columns);
		}
		
		$crud->required_fields($required_array);
		
		//Columns to show
		
		$unset_fields = $this->db->get_where('lead_bio_fields',array('show_field'=>0));
		
		if($unset_fields->num_rows() > 0){
			$columns = array_column($unset_fields->result_array(), 'lead_bio_info_column');
			
			$crud->unset_columns($columns);			
		}
		//
		//Status filter
		$crud->where(array('lead_status'=>$status));
		
		//Dropdown Status
		$crud->field_type('lead_status', 'dropdown',array('Active'=>'Active','Closed'=>'Closed'));
		
		//Relationship
		$crud->set_relation('assessment_milestones_id', 'assessment_milestones', 'milestone_name');
		
		//Display in Human Readable
		$crud->display_as('assessment_milestones_id',get_phrase('assessment'));
		
		//Hide Assessment Milestone id field on add form
		$crud->unset_fields(array('assessment_milestones_id'));
		
		//Unset delete and Edit
		$crud -> unset_delete();
		
		//Add a leads assessment action button
		$crud->add_action(get_phrase('assess_lead'), '', 'leads/lead_assessment', 'fa-book');

		//Callback
		$crud->callback_after_insert(array($this,'insert_assessment_milestone_id'));
		
		
		$output = $crud -> render();
		$page_data['page_name'] = 'leads_information';
		$page_data['view_type'] = 'leads';
		$page_data['page_title'] = get_phrase('leads_bio_information')." : ".get_phrase($status);
		$output = array_merge($page_data, (array)$output);

		$this -> load -> view('backend/index', $output);
	}

	function insert_assessment_milestone_id($post_array,$primary_key){
		
		$first_milestone = $this->db->get_where('assessment_milestones',array('milestones_insert_after_id'=>'1'))->row();
		$data['assessment_milestones_id'] = $first_milestone->assessment_milestones_id;
		
		$this->db->where(array('leads_bio_information_id'=>$primary_key));
		$this->db->update('leads_bio_information',$data);
		
		return true;
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

		$crud->add_action(get_phrase('view_assessment'), '', 'leads/lead_assessment', 'fa-book');
		
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

	function mature_leads_information() {
		if ($this -> session -> userdata('user_login') != 1)
			redirect(base_url() . 'index.php?login', 'refresh');

		$crud = new grocery_CRUD();
		$crud -> set_theme('tablestrap');
		$crud -> set_table('leads_bio_information');
		
		$status = 'Mature';
		
		//Status filter
		$crud->where(array('lead_status'=>$status));
		
		//Dropdown Status
		$crud->field_type('lead_status', 'dropdown',array('Active'=>'Active','Closed'=>'Closed', 'Mature'=>'Mature'));
		
		//Relationship
		$crud->set_relation('assessment_milestones_id', 'assessment_milestones', 'milestone_name');
		
		//Display in Human Readable
		$crud->display_as('assessment_id',get_phrase('assessment'));

		$crud->add_action(get_phrase('view_assessment'), '', 'leads/lead_assessment', 'fa-book');
		
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
	
	function lead_assessment($lead_id = '', $assessment_milestone_id = ""){
		   if ($this -> session -> userdata('user_login') != 1)
                 redirect(base_url() . 'index.php?login', 'refresh');

			 
			if($assessment_milestone_id == ''){
				$assessment_milestone_id = $this->_get_current_assessment_milestone($lead_id)['assessment_milestone_id'];	
			}	
			
			$page_data['test'] = $this->test($lead_id,$assessment_milestone_id);
			$page_data['lead_id']=$lead_id;
			$page_data['milestone']=$assessment_milestone_id;
			$page_data['is_final_milestone']=$this->_check_if_final_assessment_reached($lead_id,$assessment_milestone_id);
            $page_data['page_name'] = !$this->_check_if_final_assessment_reached($lead_id,$assessment_milestone_id)?'lead_assessment':'summative_assessment';
			$page_data['view_type'] = "leads";
			$page_data['assessment_data'] = !$this->_check_if_final_assessment_reached($lead_id,$assessment_milestone_id)?$this->_assessment_data($lead_id, $assessment_milestone_id):$this->_summative_assessment_result($lead_id, $assessment_milestone_id);
            $page_data['page_title'] = get_phrase('lead_assessment');
            $this -> load -> view('backend/index', $page_data);
		
	}

	private function _summative_assessment_result($lead_id,$assessment_milestone_id){
		$assessment_data = [
			'assessment_milestones'=>$this->_active_assessment_milestones(),
			'assessment_milestone_id'=> $assessment_milestone_id,
			'lead_profile_information'=>$this->_lead_profile_information($lead_id),
			'lead_assessment_information'=>$this->_summative_lead_assessment_report($lead_id),
			//'compute_aggregate_assessment_score'=>$this->_summative_compute_average_score($lead_id),//['1'=>74,'2'=>70,'3'=>65],
		];

		return $assessment_data;
	}

	// private function _summative_compute_average_score($lead_id){
	// 	$this->db->select(array('assessment_milestones_id','assessment_id'));
	// 	$result = $this->db->get_where('assessment',array('leads_bio_information_id'=>$lead_id))->result_array();

	// 	$score_array = [];
	// 	//$count = 1;
	// 	foreach($result as $lead_milestone_id){
	// 		$score_array[$lead_milestone_id['assessment_milestones_id']] = $this->_compute_aggregate_assessment_score($lead_id,$lead_milestone_id['assessment_id']);
	// 		//$score_array[$count] = $this->_compute_aggregate_assessment_score($lead_id,$lead_milestone_id['assessment_id']);
	// 		//$count++;
	// 	}

	// 	return $score_array;
	// }

	private function _summative_lead_assessment_report($lead_id){	
		$assessment_milestones_id = $this->_get_current_assessment_milestone($lead_id)['assessment_milestone_id'];
		
		$this->db->select(array('comment','is_completed'));
		$assessment_record = $this->db->get_where('assessment',array('leads_bio_information_id'=>$lead_id,'assessment_milestones_id'=>$assessment_milestones_id))->row();
		
		$result = [];

		$result['general_comment'] = $assessment_record->comment;
		$result['is_completed'] = $assessment_record->is_completed;
		$result['lead_id'] = $lead_id;
		$result['progress_measure_aggregate_score'] = $this->_summative_progress_measure_aggregate_score($lead_id);
		$result['connect_measures_aggregate_score'] = $this->_summative_connect_measures_aggregate_score($lead_id);


		return $result;
	}

	private function _summative_progress_measure_aggregate_score($lead_id){

		// $db_result = [
		// 	['milestone_id'=>1,'milestone_name'=>'Milestone  1','progress_measure_id'=>1,'progress_measure_name'=>'Measure 1','score'=>1,'weight'=>6],
		// 	['milestone_id'=>1,'milestone_name'=>'Milestone  1','progress_measure_id'=>2,'progress_measure_name'=>'Measure 2','score'=>1,'weight'=>4],
		// 	['milestone_id'=>1,'milestone_name'=>'Milestone  1','progress_measure_id'=>3,'progress_measure_name'=>'Measure 3','score'=>1,'weight'=>6],

		// 	['milestone_id'=>2,'milestone_name'=>'Milestone  2','progress_measure_id'=>1,'progress_measure_name'=>'Measure 1','score'=>-1,'weight'=>6],
		// 	['milestone_id'=>2,'milestone_name'=>'Milestone  2','progress_measure_id'=>2,'progress_measure_name'=>'Measure 2','score'=>1,'weight'=>4],
		// 	['milestone_id'=>2,'milestone_name'=>'Milestone  2','progress_measure_id'=>3,'progress_measure_name'=>'Measure 3','score'=>1,'weight'=>6],

		// 	['milestone_id'=>3,'milestone_name'=>'Milestone  3','progress_measure_id'=>1,'progress_measure_name'=>'Measure 1','score'=>1,'weight'=>6],
		// 	['milestone_id'=>3,'milestone_name'=>'Milestone  3','progress_measure_id'=>2,'progress_measure_name'=>'Measure 2','score'=>1,'weight'=>4],
		// 	['milestone_id'=>3,'milestone_name'=>'Milestone  3','progress_measure_id'=>3,'progress_measure_name'=>'Measure 3','score'=>-1,'weight'=>6],
		// 	['milestone_id'=>3,'milestone_name'=>'Milestone  3','progress_measure_id'=>4,'progress_measure_name'=>'Measure 4','score'=>1,'weight'=>8],

		// ];

		$this->db->select(array('assessment_milestones.assessment_milestones_id as milestone_id',
		'assessment_milestones.milestone_name as milestone_name',
		'assessment_progress_measure.assessment_progress_measure_id as progress_measure_id',
		'assessment_progress_measure.progress_measure_title as progress_measure_name',
		'assessment_result.score as score',
		'assessment_result.progress_measure_weight as weight'));
		$this->db->join('assessment','assessment.assessment_id=assessment_result.assessment_id');
		$this->db->join('assessment_progress_measure','assessment_progress_measure.assessment_progress_measure_id=assessment_result.assessment_progress_measure_id');
		$this->db->join('assessment_milestones','assessment_milestones.assessment_milestones_id=assessment.assessment_milestones_id');
		$db_result = $this->db->get_where('assessment_result',array('leads_bio_information_id'=>$lead_id))->result_array();


		$result = [];

		foreach($db_result as $row){
			$result[$row['progress_measure_id']][$row['milestone_id']]['milestone_name'] = $row['milestone_name'];
			$result[$row['progress_measure_id']][$row['milestone_id']]['progress_measure_name'] = $row['progress_measure_name'];

			$avoid_divide_weight_by_zero= $row['weight']>0?($this->_progress_measure_weighted_score($row['score'],$row['weight']) / $row['weight']) * 100:0;

			$result[$row['progress_measure_id']][$row['milestone_id']]['weighted_score'] = $avoid_divide_weight_by_zero;

			//$result[$row['progress_measure_id']][$row['milestone_id']]['weighted_score'] = ($this->_progress_measure_weighted_score($row['score'],$row['weight']) / $row['weight']) * 100;
		}

		// $progress_measure_id = 1; // One loop interation

		// //Milestone 1
		// $result['m1']['milestone_name'] = $this->_milestone_name($assessment_milestone_id);
		
		// $result['m1']['progress_measures']['p1']['progress_measure_name'] = $this->_progress_measure_name($lead_id,$progress_measure_id);
		// $result['m1']['progress_measures']['p1']['score'] = $this->_progress_measure_score($lead_id,$assessment_milestone_id);

		// $result['m1']['progress_measures']['p2']['progress_measure_name'] = $this->_progress_measure_name($lead_id,$progress_measure_id);
		// $result['m1']['progress_measures']['p2']['score'] = $this->_progress_measure_score($lead_id,$assessment_milestone_id);

		// $result['m1']['progress_measures']['p3']['progress_measure_name'] = $this->_progress_measure_name($lead_id,$progress_measure_id);
		// $result['m1']['progress_measures']['p3']['score'] = $this->_progress_measure_score($lead_id,$assessment_milestone_id);

		// //Milestone 2
		// $result['m2']['milestone_name'] = $this->_milestone_name($assessment_milestone_id);
		
		// $result['m2']['progress_measures']['p1']['progress_measure_name'] = $this->_progress_measure_name($lead_id,$progress_measure_id);
		// $result['m2']['progress_measures']['p1']['score'] = $this->_progress_measure_score($lead_id,$assessment_milestone_id);

		// $result['m2']['progress_measures']['p2']['progress_measure_name'] = $this->_progress_measure_name($lead_id,$progress_measure_id);
		// $result['m2']['progress_measures']['p2']['score'] = $this->_progress_measure_score($lead_id,$assessment_milestone_id);

		// $result['m2']['progress_measures']['p3']['progress_measure_name'] = $this->_progress_measure_name($lead_id,$progress_measure_id);
		// $result['m2']['progress_measures']['p3']['score'] = $this->_progress_measure_score($lead_id,$assessment_milestone_id);

		// $result['m2']['progress_measures']['p4']['progress_measure_name'] = $this->_progress_measure_name($lead_id,$progress_measure_id);
		// $result['m2']['progress_measures']['p4']['score'] = $this->_progress_measure_score($lead_id,$assessment_milestone_id);


		return $result;
	}

	// private function _milestone_name($assessment_milestone_id){
	// 	return "Milestone 1";
	// }

	// private function _progress_measure_name(){
	// 	return "Measure 1";
	// }

	private function _progress_measure_weighted_score($score,$weight){
		$actual_scored = 0;

			if($score == 1){
				$actual_scored += $score * $weight;
			}elseif($score == -1){
				$actual_scored += $weight * $this->config->item('low_score_progress_measure_weight_ratio');
			}
		
		return $actual_scored;
	}

	private function _summative_connect_measures_aggregate_score($lead_id){
		
		// $db_result = [
		// 	['connect_stage_id'=>1,'connect_stage_name'=>'Connect Stage 1','progress_measure_id'=>1,'progress_measure_name'=>'Measure 1','connect_parameter_id'=>1,'connect_parameter_name'=>'Connect Parameter 1','progress_measure_score'=>1,'weight'=>6],
		// 	['connect_stage_id'=>1,'connect_stage_name'=>'Connect Stage 1','progress_measure_id'=>2,'progress_measure_name'=>'Measure 2','connect_parameter_id'=>1,'connect_parameter_name'=>'Connect Parameter 1','progress_measure_score'=>1,'weight'=>4],
		// 	['connect_stage_id'=>1,'connect_stage_name'=>'Connect Stage 1','progress_measure_id'=>3,'progress_measure_name'=>'Measure 3','connect_parameter_id'=>2,'connect_parameter_name'=>'Connect Parameter 2','progress_measure_score'=>-1,'weight'=>8],
		// 	['connect_stage_id'=>2,'connect_stage_name'=>'Connect Stage 2','progress_measure_id'=>4,'progress_measure_name'=>'Measure 4','connect_parameter_id'=>3,'connect_parameter_name'=>'Connect Parameter 3','progress_measure_score'=>-1,'weight'=>10],
		// 	['connect_stage_id'=>2,'connect_stage_name'=>'Connect Stage 2','progress_measure_id'=>5,'progress_measure_name'=>'Measure 5','connect_parameter_id'=>4,'connect_parameter_name'=>'Connect Parameter 4','progress_measure_score'=>1,'weight'=>4],
		// ];

		$this->db->select(array('connect_stage.connect_stage_id as connect_stage_id',
			'connect_stage.connect_stage_name as connect_stage_name',
			'assessment_progress_measure.assessment_progress_measure_id as progress_measure_id',
			'assessment_progress_measure.progress_measure_title as progress_measure_name',
			'compassion_connect_mapping.compassion_connect_mapping_id as connect_parameter_id',
			'compassion_connect_mapping.connect_lead_stage_parameter as connect_parameter_name',
			'assessment_result.score as progress_measure_score',
			'assessment_result.progress_measure_weight as weight'	
		));
		$this->db->join('assessment','assessment.assessment_id=assessment_result.assessment_id');
		$this->db->join('assessment_progress_measure','assessment_progress_measure.assessment_progress_measure_id=assessment_result.assessment_progress_measure_id');
		$this->db->join('compassion_connect_mapping','compassion_connect_mapping.compassion_connect_mapping_id=assessment_progress_measure.compassion_connect_mapping_id');
		$this->db->join('connect_stage','connect_stage.connect_stage_id=compassion_connect_mapping.connect_stage_id');
		$db_result = $this->db->get_where('assessment_result',array('assessment.leads_bio_information_id'=>$lead_id))->result_array();

		$result = [];

		foreach($db_result as $assessment_result){
			$result[$assessment_result['progress_measure_id']][$assessment_result['connect_stage_id']]['connect_stage_name'] = $assessment_result['connect_stage_name'];
			$result[$assessment_result['progress_measure_id']][$assessment_result['connect_stage_id']]['progress_measure_name'] = $assessment_result['progress_measure_name'];
			$result[$assessment_result['progress_measure_id']][$assessment_result['connect_stage_id']]['connect_stage_parameters'][$assessment_result['connect_parameter_id']]['connect_parameter_name'] = $assessment_result['connect_parameter_name'];
			$result[$assessment_result['progress_measure_id']][$assessment_result['connect_stage_id']]['connect_stage_parameters'][$assessment_result['connect_parameter_id']]['progress_measure_score'] = $this->_sum_of_progress_scores_in_connect_paramter($lead_id,$assessment_result['progress_measure_id'],$assessment_result['connect_parameter_id']);
		}
		
		// $result['p1']['cs1']['connect_stage_name'] = "Connect Stage 1";
		// $result['p1']['cs1']['progress_measure_name'] = "Measure 1";
		// $result['p1']['cs1']['connect_stage_parameters']['ps1']['connect_parameter_name'] = "Connect Parameter 1";
		// $result['p1']['cs1']['connect_stage_parameters']['ps1']['progress_measure_score'] = $this->_progress_measure_weighted_score(1,6);

		// $result['p2']['cs1']['connect_stage_name'] = "Connect Stage 1";
		// $result['p2']['cs1']['progress_measure_name'] = "Measure 2";
		// $result['p2']['cs1']['connect_stage_parameters']['ps1']['connect_parameter_name'] = "Connect Parameter 1";
		// $result['p2']['cs1']['connect_stage_parameters']['ps1']['progress_measure_score'] = $this->_progress_measure_weighted_score(1,4);

		// $result['p3']['cs1']['connect_stage_name'] = "Connect Stage 1";
		// $result['p3']['cs1']['progress_measure_name'] = "Measure 3";
		// $result['p3']['cs1']['connect_stage_parameters']['ps2']['connect_parameter_name'] = "Connect Parameter 2";
		// $result['p3']['cs1']['connect_stage_parameters']['ps2']['progress_measure_score'] = $this->_progress_measure_weighted_score(-1,8);

		// $result['p4']['cs2']['connect_stage_name'] = "Connect Stage 2";
		// $result['p4']['cs2']['progress_measure_name'] = "Measure 4";
		// $result['p4']['cs2']['connect_stage_parameters']['ps3']['connect_parameter_name'] = "Connect Parameter 3";
		// $result['p4']['cs2']['connect_stage_parameters']['ps3']['progress_measure_score'] = $this->_progress_measure_weighted_score(-1,10);

		// $result['p5']['cs2']['connect_stage_name'] = "Connect Stage 2";
		// $result['p5']['cs2']['progress_measure_name'] = "Measure 5";
		// $result['p5']['cs2']['connect_stage_parameters']['ps4']['connect_parameter_name'] = "Connect Parameter 4";
		// $result['p5']['cs2']['connect_stage_parameters']['ps4']['progress_measure_score'] = $this->_progress_measure_weighted_score(1,4);



		return $result;
	}

	function complete_summative_assessment($lead_id){

		$current_assessment_milestones_id = $this->_get_current_assessment_milestone($lead_id)['assessment_milestone_id'];
		
		if($this->_check_if_final_assessment_reached($lead_id)){
			
			$this->db->trans_start();

			$closure_status = $this->input->post('btn_mature');

			$this->db->where(array('assessment_milestones_id'=>$current_assessment_milestones_id,'leads_bio_information_id'=>$lead_id));
			
			$data['is_completed'] =  1;
			$data['comment'] = $this->input->post('general_comment');
			
			$data['closure_status'] = isset($closure_status) ? 1 : 2;
			$data['assessment_last_modified_by'] = $this->session->login_user_id;

			$this->db->update('assessment',$data);

			// Update leads status
			$this->db->where(array('leads_bio_information_id'=>$lead_id));
			$info['lead_status'] = isset($closure_status) ? "Mature" : "Closed";
			$this->db->update('leads_bio_information',$info);

			
			$this->db->trans_complete();

			if($this->db->trans_status() == false){
				$this->session->set_flashdata('flash_message', 'Update failure');
			}else{
				$this->session->set_flashdata('flash_message', 'Update success');
			}


		}

		redirect(base_url().'leads/lead_assessment/'.$lead_id.'/'.$current_assessment_milestones_id,'refresh');
	}

	private function _sum_of_progress_scores_in_connect_paramter($lead_id,$progress_measure_id,$connect_parameter_id){
		
		$this->db->select(array('progress_measure_weight as weight','score'));
		$this->db->join('assessment','assessment.assessment_id=assessment_result.assessment_id');
		$this->db->join('assessment_progress_measure','assessment_progress_measure.assessment_progress_measure_id=assessment_result.assessment_progress_measure_id');
		$this->db->join('compassion_connect_mapping','compassion_connect_mapping.compassion_connect_mapping_id=assessment_progress_measure.compassion_connect_mapping_id');
		$result  = $this->db->get_where('assessment_result',
		array('assessment.leads_bio_information_id'=>$lead_id,
		'assessment_result.assessment_progress_measure_id'=>$progress_measure_id,
		'compassion_connect_mapping.compassion_connect_mapping_id'=>$connect_parameter_id))->result_array();
		
		$weighted_scores = 0;
		$count = 0;
		foreach($result as $progress_measure_score_and_weight){
			$weighted_scores += $this->_progress_measure_weighted_score($progress_measure_score_and_weight['score'],$progress_measure_score_and_weight['weight']);
			$count++;
		}
		$some_of_possible_weight=array_sum(array_column($result,'weight'));
		
		$calculated_weighted_score=$some_of_possible_weight>0?($weighted_scores/$some_of_possible_weight):0;
		
		return number_format($calculated_weighted_score * 100,2);

		//return number_format(($weighted_scores/array_sum(array_column($result,'weight'))) * 100,2);
	}

	private function _check_if_final_assessment_reached($lead_id,$passed_milestone_id = ''){

		$check_if_final_assessment_reached = false;

		if($passed_milestone_id == ''){
			$passed_milestone_id = $this->_get_current_assessment_milestone($lead_id)['assessment_milestone_id'];	
		}

		$this->db->select(array('is_final_milestone'));
		$this->db->where(array('assessment_milestones_id'=>$passed_milestone_id,'is_final_milestone'=>1));	
		$result = $this->db->get('assessment_milestones');

		if($result->num_rows() > 0){
			$check_if_final_assessment_reached = true;
		}

		return $check_if_final_assessment_reached;
	}

	private function _auto_create_initial_assessment($lead_id){

		$lead_assessments_raw_object = $this->db->get_where('assessment',array('leads_bio_information_id'=>$lead_id));
		
		if($lead_assessments_raw_object->num_rows() == 0){
			
			$initial_assessment_milestone = $this->db->select(array('assessment_milestones_id'))->get_where('assessment_milestones',
				array('is_initial_milestone'=>1))->row()->assessment_milestones_id;

			//$data = [];	
			$_data['leads_bio_information_id'] = $lead_id;
			$_data['assessment_milestones_id'] = $initial_assessment_milestone;
			$_data['is_completed'] = 0;
			$_data['comment'] = '';
			$_data['assessment_created_date'] = date('Y-m-d');
			$_data['assessment_created_by'] = $this->session->login_user_id;
			$_data['assessment_last_modified_by'] = $this->session->login_user_id;
			$_data['assessment_last_modified_date'] = date('Y-m-d h:i:s');

			$this->db->insert('assessment',$_data);
			
			$check_if_assessment_exists = true;
			
		}
	}

	private function _get_current_assessment_milestone($lead_id){

		$assessment_milestone  = [];

		$this->_auto_create_initial_assessment($lead_id);
		
		$assessment_id = $this->db->select_max('assessment_id')->get_where('assessment',array('leads_bio_information_id'=>$lead_id))->row()->assessment_id;
			
		$this->db->join('assessment_milestones','assessment_milestones.assessment_milestones_id=assessment.assessment_milestones_id');
		$assessment_milestone = $this->db->select(array('assessment_milestones.assessment_milestones_id as assessment_milestone_id','milestone_name'))->get_where('assessment',
			array('assessment_id'=>$assessment_id))->row_array();	

		// Return a milestone array
		//return ['assessment_milestone_id'=>1,'assessment_milestone_name'=>'Initial Assessment'];
		return $assessment_milestone;
	}

	/**
	 * @todo - Redo considering that these fields can be added dynamically
	 */
	private function _lead_profile_information($lead_id){
		
		$lead_profile_information = $this->db->
			select(array('lead_connect_id','denomination','lead_name','congregation_size','lead_location'))->
			get_where('leads_bio_information',
			array('leads_bio_information_id'=>$lead_id))->row_array();

		return $lead_profile_information;
	}

	private function _lead_assessment_information($lead_id,$assessment_milestone_id){

		$lead_assessment_information = [];

		$this->db->select(array('assessment_id','milestone_name','assessment_review_status',
		'user_customized_review_status','is_completed','comment','assessment_last_modified_by',
		'assessment_last_modified_date','firstname','lastname'));
		$this->db->join('user','user.user_id=assessment.assessment_last_modified_by');
		$this->db->join('assessment_milestones','assessment_milestones.assessment_milestones_id=assessment.assessment_milestones_id');
		$this->db->where(array('assessment.leads_bio_information_id'=>$lead_id));
		$this->db->where(array('assessment.assessment_milestones_id'=>$assessment_milestone_id));
		$lead_assessment_information_raw = $this->db->get('assessment');


		if($lead_assessment_information_raw->num_rows() > 0){
			
			extract($lead_assessment_information_raw->row_array());
		
			$lead_assessment_information['assessment_id'] = $assessment_id;
			$lead_assessment_information['milestone_name'] = $milestone_name;
			$lead_assessment_information['status_label'] = $user_customized_review_status !== ''?$user_customized_review_status:$assessment_review_status;
			$lead_assessment_information['is_completed'] = $is_completed;
			$lead_assessment_information['overall_score'] = $this->_compute_aggregate_assessment_score($lead_id,$assessment_id);
			$lead_assessment_information['completion_date'] = date('jS F Y',strtotime($assessment_last_modified_date));
			$lead_assessment_information['last_modified_by'] = $firstname.' '.$lastname;
			$lead_assessment_information['assessment_result'] = $this->_lead_assessment_results($assessment_id);
			$lead_assessment_information['general_comment'] = $comment;
			$lead_assessment_information['next_assessment_milestone_id'] = $this->_next_assessment_milestone_id();
		}

		return $lead_assessment_information;
	}

	private function _compute_aggregate_assessment_score($lead_id,$assessment_id){
		$this->db->select(array('assessment_result.assessment_progress_measure_id as assessment_progress_measure_id','score','progress_measure_weight'));
		//$this->db->join('assessment_progress_measure','assessment_progress_measure.assessment_progress_measure_id=assessment_result.assessment_progress_measure_id');
		$this->db->where(array('assessment_id'=>$assessment_id));
		$results = $this->db->get('assessment_result')->result_array();

		$actual_scored = 0;
		$highest_possible_score = $this->_compute_max_possible_milestone_weight($this->_get_current_assessment_milestone($lead_id)['assessment_milestone_id']);

		foreach($results as $result){
			// if($result['score'] == 1){
			// 	$actual_scored += $result['score'] * $result['progress_measure_weight'];
			// }elseif($result['score'] == -1){
			// 	$actual_scored += $result['progress_measure_weight'] * $this->config->item('low_score_progress_measure_weight_ratio');
			// }
			$actual_scored += $this->_progress_measure_weighted_score($result['score'],$result['progress_measure_weight']);
		}
		$sub_aggregate_score=$highest_possible_score>0?$actual_scored / $highest_possible_score:0;
		
		$aggregate_score = number_format(($sub_aggregate_score) * 100);

		return $aggregate_score;
	}

	private function _compute_max_possible_milestone_weight($assessment_milestone_id){
		
		$this->db->select(array('rel_milestone_measure.assessment_progress_measure_id as assessment_progress_measure_id','weight'));
		
		$this->db->join('rel_milestone_measure','rel_milestone_measure.assessment_progress_measure_id=assessment_progress_measure.assessment_progress_measure_id');
		$this->db->join('assessment_milestones','assessment_milestones.assessment_milestones_id=rel_milestone_measure.assessment_milestones_id');
		$this->db->where(array('rel_milestone_measure.assessment_milestones_id'=>$assessment_milestone_id));
		$results = $this->db->get('assessment_progress_measure')->result_array();

		return array_sum(array_column($results,'weight'));
	}

		
	private function _lead_assessment_results($assessment_id){
	
		$this->db->select(array('assessment_progress_measure.assessment_progress_measure_id as assessment_progress_measure_id','progress_measure_title','assessment_id','assessment_progress_measure.assessment_progress_measure_id as assessment_progress_measure_id'));
		$this->db->join('assessment_milestones','assessment_milestones.assessment_milestones_id=assessment.assessment_milestones_id');
		$this->db->join('rel_milestone_measure','rel_milestone_measure.assessment_milestones_id=assessment_milestones.assessment_milestones_id');
		$this->db->join('assessment_progress_measure','assessment_progress_measure.assessment_progress_measure_id=rel_milestone_measure.assessment_progress_measure_id');
		$this->db->where(array('assessment_id'=>$assessment_id));
		$this->db->where(array('assessment_progress_measure.status'=>1));
		
		$progress_measure_main_array = $this->db->get('assessment')->result_array();

		$progress_measure_array = [];

		foreach($progress_measure_main_array as $progress_measure){
			extract($progress_measure);

			$progress_measure_array[$assessment_progress_measure_id]['progress_measure']['progress_measure_id'] = $assessment_progress_measure_id;
			$progress_measure_array[$assessment_progress_measure_id]['progress_measure']['progress_measure_name'] = $progress_measure_title;
			$progress_measure_array[$assessment_progress_measure_id]['verification_tools'] = $this->_progress_measure_verification_tools($assessment_id,$assessment_progress_measure_id);
			$progress_measure_array[$assessment_progress_measure_id]['methods_of_assessment'] = $this->_progress_measure_assessment_methods($assessment_id,$assessment_progress_measure_id);
			$progress_measure_array[$assessment_progress_measure_id]['score'] = $this->_progress_measure_score_comment($assessment_id,$assessment_progress_measure_id)['score'];
			$progress_measure_array[$assessment_progress_measure_id]['comment'] = $this->_progress_measure_score_comment($assessment_id,$assessment_progress_measure_id)['comment'];
		}	

		return $progress_measure_array;
	}

	private function _progress_measure_verification_tools($assessment_id,$assessment_progress_measure_id){

		$this->db->select(array('assessment_verification_tool.assessment_verification_tool_id as assessment_verification_tool_id','verification_tool_name'));
		$this->db->join('assessment_verification_tool','assessment_verification_tool.verification_tool_id=verification_tool.verification_tool_id');
		$this->db->join('assessment_progress_measure','assessment_progress_measure.assessment_progress_measure_id=assessment_verification_tool.assessment_progress_measure_id');
		
		$this->db->where(array('assessment_verification_tool.assessment_progress_measure_id'=>$assessment_progress_measure_id));
		$this->db->where(array('verification_tool.status'=>1));
		
		$verification_tools = $this->db->get('verification_tool')->result_array();
		
		$valid_measure_tools = [];

		$cnt = 0;
		foreach($verification_tools as $tool){
			extract($tool);
			$valid_measure_tools[$cnt]['verification_tool_id'] = $assessment_verification_tool_id;
			$valid_measure_tools[$cnt]['verification_tool_name'] = $verification_tool_name;
			$valid_measure_tools[$cnt]['selected'] = $this->_is_verification_tool_selected($assessment_id, $assessment_verification_tool_id);
			$cnt++;
		}

		return $valid_measure_tools;
	}

	private function _is_verification_tool_selected($assessment_id, $assessment_verification_tool_id){
		//return true;

		$_is_verification_tool_is_selected = false;
		
		$this->db->join('assessment_result','assessment_result.assessment_result_id=assessment_result_tool.assessment_result_id');
		$this->db->join('assessment','assessment.assessment_id=assessment_result.assessment_id');
		
		$this->db->where(array('assessment_result_tool.assessment_verification_tool_id'=>$assessment_verification_tool_id));
		$this->db->where(array('assessment_result.assessment_id'=>$assessment_id));
		$tools_obj = $this->db->get('assessment_result_tool');

		if($tools_obj->num_rows() > 0){
			$_is_verification_tool_is_selected = true;
		}

		return $_is_verification_tool_is_selected;
	}

	private function _progress_measure_assessment_methods($assessment_id,$assessment_progress_measure_id){

		$this->db->select(array('assessment_method.assessment_method_id as assessment_method_id','method_name'));

		$this->db->join('assessment_method','assessment_method.method_id=method.method_id');
		$this->db->join('assessment_progress_measure','assessment_progress_measure.assessment_progress_measure_id=assessment_method.assessment_progress_measure_id');
		
		$this->db->where(array('assessment_method.assessment_progress_measure_id'=>$assessment_progress_measure_id));
		$this->db->where(array('method.status'=>1));
		
		$methods = $this->db->get('method')->result_array();
		
		$valid_methods = [];

		$cnt = 0;
		foreach($methods as $method){
			extract($method);
			$valid_methods[$cnt]['assessment_method_id'] = $assessment_method_id;
			$valid_methods[$cnt]['assessment_method_name'] = $method_name;
			$valid_methods[$cnt]['selected'] = $this->_is_method_selected($assessment_id, $assessment_method_id);
			$cnt++;
		}

		return $valid_methods;
	}

	private function _is_method_selected($assessment_id,$assessment_method_id){
		//return true;
		$_is_method_selected = false;
		
		$this->db->join('assessment_result','assessment_result.assessment_result_id=assessment_result_method.assessment_result_id');
		$this->db->join('assessment','assessment.assessment_id=assessment_result.assessment_id');
		
		$this->db->where(array('assessment_result_method.assessment_method_id'=>$assessment_method_id));
		$this->db->where(array('assessment_result.assessment_id'=>$assessment_id));
		$tools_obj = $this->db->get('assessment_result_method');

		if($tools_obj->num_rows() > 0){
			$_is_method_selected = true;
		}

		return $_is_method_selected;
	}

	private function _progress_measure_score_comment($assessment_id,$assessment_progress_measure_id){
		$result = ['score'=>0,'comment'=>''];

		$this->db->select(array('score','comment'));
		$this->db->where(array('assessment_id'=>$assessment_id,'assessment_progress_measure_id'=>$assessment_progress_measure_id));
		$result_obj  = $this->db->get('assessment_result');

		if($result_obj->num_rows() > 0){
			$result = $result_obj->row_array();
		}

		return $result;

	}


	/**
	 * @todo - Redo considering milestones can be added dynamically
	 */
	private function _active_assessment_milestones(){

		$assement_milestones = $this->db->
		select(array('assessment_milestones_id as assessment_milestone_id','milestone_name as assessment_milestone_name','assessment_milestone_initial'))->get_where('assessment_milestones',
		array('status'=>1,'assessment_milestones_id > '=>1))->result_array();

		return $assement_milestones;
	}

	private function _assessment_data($lead_id, $assessment_milestone_id){

		$assessment_data = [
			'assessment_milestones'=>$this->_active_assessment_milestones(),
			'assessment_milestone_id'=> $assessment_milestone_id,
			'lead_profile_information'=>$this->_lead_profile_information($lead_id),
			'lead_assessment_information'=>$this->_lead_assessment_information($lead_id, $assessment_milestone_id),
		];

		return $assessment_data;
	}

	/**
	 * @todo -  to be completed 
	 */
	function submit_assessment(){

		$assessment_id = $this->input->post('assessment_id');
		$lead_id = $this->input->post('lead_id');
		$next_assessment_milestone_id = $this->input->post('next_assessment_milestone_id');

		// Update assessment record as complete
		$data['is_completed'] = 1;
		$this->db->where('assessment_id',$assessment_id);
		$this->db->update('assessment',$data);

		// Create the next assessment record
		$new_assessment['leads_bio_information_id'] = $lead_id;
		$new_assessment['assessment_milestones_id'] = $next_assessment_milestone_id;
		$new_assessment['is_completed'] = 0;
		$new_assessment['comment'] = '';
		$new_assessment['assessment_created_date'] = date('Y-m-d');
		$new_assessment['assessment_created_by'] = $this->session->login_user_id;
		$new_assessment['assessment_last_modified_by'] = $this->session->login_user_id;
		
		$this->db->insert('assessment',$new_assessment);

		// Update Lead record with the current assessment milestone
		$leads_data['assessment_milestones_id'] = $next_assessment_milestone_id;
		$this->db->where(array('leads_bio_information_id'=>$lead_id));
		$this->db->update('leads_bio_information',$leads_data);

		echo 'Assessment has been submitted successfully';

	}

	private function _next_assessment_milestone_id(){
		$current_assessment_milestones_id = $this->_get_current_assessment_milestone($this->uri->segment(3))['assessment_milestone_id'];

		$next_assement_milestones = $this->db->
		select(array('assessment_milestones_id as assessment_milestone_id','milestone_name as assessment_milestone_name',
		'assessment_milestone_initial'))->get_where('assessment_milestones',
		array('status'=>1,'assessment_milestones_id > '=>$current_assessment_milestones_id))->first_row();

		if($this->_check_if_final_assessment_reached($this->uri->segment(3))){
			return 0;
		}else{
			return $next_assement_milestones->assessment_milestone_id;
		}
		
	}

	function test($lead_id,$assessment_milestone_id){

		// $this->db->select(array('rel_milestone_measure.assessment_progress_measure_id as assessment_progress_measure_id','weight'));
		
		// $this->db->join('rel_milestone_measure','rel_milestone_measure.assessment_progress_measure_id=assessment_progress_measure.assessment_progress_measure_id');
		// $this->db->join('assessment_milestones','assessment_milestones.assessment_milestones_id=rel_milestone_measure.assessment_milestones_id');
		// $this->db->where(array('rel_milestone_measure.assessment_milestones_id'=>$assessment_milestone_id));
		// $results = $this->db->get('assessment_progress_measure')->result_array();

		return '';//array_sum(array_column($results,'weight'));
	}

	private function create_assessment_result_if_not_existing($assessment_id,$progress_measure_id){
		$assessment_result_obj = $this->db->get_where('assessment_result',
		array('assessment_id'=>$assessment_id,
		'assessment_progress_measure_id'=>$progress_measure_id));

		if($assessment_result_obj->num_rows() == 0){
			
			$result_data['assessment_id'] = $assessment_id;
			$result_data['assessment_progress_measure_id'] = $progress_measure_id;
			$result_data['score'] = 0;
			$result_data['comment'] = '';
			$result_data['assessment_result_created_date'] = date('Y-m-d');

			$this->db->insert('assessment_result',$result_data);
		}

		$assessment_result_id = $this->db->get_where('assessment_result',
		array('assessment_id'=>$assessment_id,
		'assessment_progress_measure_id'=>$progress_measure_id))->row()->assessment_result_id;

		return $assessment_result_id;
	}

	private function _remove_deselected_assessement_method($assessment_result_id,$assessment_method_ids){

		$this->db->where(array('assessment_result_id'=>$assessment_result_id));
		$assessment_result_methods_obj = $this->db->get('assessment_result_method');

		if($assessment_result_methods_obj->num_rows() > 0){
			$assessment_result_methods = $assessment_result_methods_obj->result_array();
			
			foreach($assessment_result_methods as $assessment_result_method){
				if(!in_array($assessment_result_method['assessment_method_id'],$assessment_method_ids)){
					$this->db->where(array('assessment_result_id'=>$assessment_result_id,
					'assessment_method_id'=>$assessment_result_method['assessment_method_id']));
					$this->db->delete('assessment_result_method');
				}
			}
		}
	}

	function post_assessment_method(){
		$methods_post = $this->input->post();

		$assessment_methods_ids = $methods_post['ids'];
		$assessment_id = $methods_post['assessment_id'];
		$progress_measure_id = $methods_post['progress_measure_id'];

		$assessment_result_id = $this->create_assessment_result_if_not_existing($assessment_id,$progress_measure_id);
		$this->_remove_deselected_assessement_method($assessment_result_id,$assessment_methods_ids);

		foreach($assessment_methods_ids as $assessment_methods_id){
			
			$this->db->join('assessment_result',
			'assessment_result.assessment_result_id=
			assessment_result_method.assessment_result_id');

			$this->db->join('assessment',
			'assessment.assessment_id=assessment_result.assessment_id');

			$this->db->where(array('assessment_result.assessment_id'=>$assessment_id,
			'assessment_result.assessment_progress_measure_id'=>$progress_measure_id,
			'assessment_result_method.assessment_method_id'=>$assessment_methods_id));

			$method_obj = $this->db->get('assessment_result_method');

			if($method_obj->num_rows() == 0){	
				$data['assessment_result_id'] = $assessment_result_id;
				$data['assessment_method_id'] = $assessment_methods_id;
				$this->db->insert('assessment_result_method',$data);
			}
		}		
	}

	private function _remove_deselected_assessement_verification_tool($assessment_result_id,$assessment_verification_tool_ids){

		$this->db->where(array('assessment_result_id'=>$assessment_result_id));
		$assessment_result_tools_obj = $this->db->get('assessment_result_tool');

		if($assessment_result_tools_obj->num_rows() > 0){
			$assessment_result_tools = $assessment_result_tools_obj->result_array();
			
			foreach($assessment_result_tools as $assessment_result_tool){
				if(!in_array($assessment_result_tool['assessment_verification_tool_id'],$assessment_verification_tool_ids)){
					$this->db->where(array('assessment_result_id'=>$assessment_result_id,
					'assessment_verification_tool_id'=>$assessment_result_tool['assessment_verification_tool_id']));
					$this->db->delete('assessment_result_tool');
				}
			}
		}
	} 

	function post_assessment_verification_tools(){
		$verification_tools_post = $this->input->post();

		$assessment_verification_tools_ids = $verification_tools_post['ids'];
		$assessment_id = $verification_tools_post['assessment_id'];
		$progress_measure_id = $verification_tools_post['progress_measure_id'];

		$assessment_result_id = $this->create_assessment_result_if_not_existing($assessment_id,$progress_measure_id);
		
		$this->_remove_deselected_assessement_verification_tool($assessment_result_id,$assessment_verification_tools_ids);

		foreach($assessment_verification_tools_ids as $assessment_verification_tools_id){
			
			$this->db->join('assessment_result',
			'assessment_result.assessment_result_id=
			assessment_result_tool.assessment_result_id');

			$this->db->join('assessment',
			'assessment.assessment_id=assessment_result.assessment_id');

			$this->db->where(array('assessment_result.assessment_id'=>$assessment_id,
			'assessment_result.assessment_progress_measure_id'=>$progress_measure_id,
			'assessment_result_tool.assessment_verification_tool_id'=>$assessment_verification_tools_id));

			$verification_tools_obj = $this->db->get('assessment_result_tool');

			if($verification_tools_obj->num_rows() == 0){	
				$data['assessment_result_id'] = $assessment_result_id;
				$data['assessment_verification_tool_id'] = $assessment_verification_tools_id;
				$this->db->insert('assessment_result_tool',$data);
			}
		}

		//echo json_encode($assessment_verification_tools_ids);
	}

	function post_assessment_score(){
		$score_post = $this->input->post();

		$score = $score_post['score'];
		$assessment_id = $score_post['assessment_id'];
		$progress_measure_id = $score_post['progress_measure_id'];
		$lead_id = $score_post['lead_id'];

		$assessment_result_id = $this->create_assessment_result_if_not_existing($assessment_id,$progress_measure_id);
		
		$progress_measure_weight = $this->_get_progress_measure_weight($progress_measure_id);

		$data['score'] = $score;
		$data['progress_measure_weight'] = $score == -1?$progress_measure_weight * $this->config->item('low_score_progress_measure_weight_ratio'):$progress_measure_weight;
		$this->db->where(array('assessment_id'=>$assessment_id,'assessment_progress_measure_id'=>$progress_measure_id));
		$this->db->update('assessment_result',$data);
		
		echo $this->_compute_aggregate_assessment_score($lead_id,$assessment_id);
	}

	private function _get_progress_measure_weight($progress_measure_id){

		$this->db->select(array('weight'));
		$weight = $this->db->get_where('assessment_progress_measure',
			array('assessment_progress_measure_id'=>$progress_measure_id))->row()->weight;
		
		return $weight; 	
	}

	function post_assessment_progress_measure_comment(){
		$comment_post = $this->input->post();

		$comment = $comment_post['comment'];
		$assessment_id = $comment_post['assessment_id'];
		$progress_measure_id = $comment_post['progress_measure_id'];

		$assessment_result_id = $this->create_assessment_result_if_not_existing($assessment_id,$progress_measure_id);
		
		$data['comment'] = $comment;
		$this->db->where(array('assessment_id'=>$assessment_id,'assessment_progress_measure_id'=>$progress_measure_id));
		$this->db->update('assessment_result',$data);
		
		//echo json_encode($score_post);
	}
	
	function post_assessment_general_comment(){
		$comment_post = $this->input->post();

		$comment = $comment_post['comment'];
		$assessment_id = $comment_post['assessment_id'];

		$data['comment'] = $comment;
		$this->db->where(array('assessment_id'=>$assessment_id));
		$this->db->update('assessment',$data);

	}

}
