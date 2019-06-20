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
		
		$this->load->model('finance_model');
		
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

    //Default function, redirects to logged in user area
    public function index() {

        if ($this->session->userdata('user_login') != 1)  
        	redirect(base_url() . 'login', 'refresh');
		
        $page_data['page_title']='Dashboard';
		$page_data['page_name']='dashboard';
		$page_data['view_type']='dashboard';
        $this->load->view('backend/index',$page_data);
    }

}
