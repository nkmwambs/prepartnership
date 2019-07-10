<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/*	
 *	@author 	: Nicodemus Karisa
 *	date		: 6th June, 2018
 *	AFR Staff Recognition system
 *	https://www.compassion.com
 *	NKarisa@ke.ci.org
 */

class Dashboard extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('crud_model');
		
        $this->load->database();
        $this->load->library('session');
		$this->session->set_userdata('view_type','dashboard');
        /* cache control */
		$this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
		$this->output->set_header('Pragma: no-cache');
		//$this->db->cache_on();
		//$this->output->cache(60);
		$this->db->cache_delete_all();
    }
	
	function update_insert_after_column($milestone_id,$insert_after_id){
				
		//Check if the $insert_after_id has a duplicate, if yes get the first record
		$insert_after_duplicates = $this->db->get_where('assessment_milestones',
		array('milestones_insert_after_id'=>$insert_after_id));
		
		if($insert_after_duplicates->num_rows()>1){
			$first_occurence_of_insert_after_id = $insert_after_duplicates->row(0);
			
			//Get id of the first occurence
			$first_occurence_id = $first_occurence_of_insert_after_id->assessment_milestones_id;
			
			//Update the first occurence insert_after_id
			$this->db->where(array('assessment_milestones_id'=>$first_occurence_id));
			$this->db->update('assessment_milestones',array('milestones_insert_after_id'=>$milestone_id));
		}
	}

    //Default function, redirects to logged in user area
    public function index() {

        if ($this->session->userdata('user_login') != 1)  
        	redirect(base_url() . 'login', 'refresh');
		
		//$this->update_insert_after_column(17, 8);
		
        $page_data['page_title']='Dashboard';
		$page_data['page_name']='dashboard';
		$page_data['view_type']='dashboard';
        $this->load->view('backend/index',$page_data);
    }

}
