<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Compasion International
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		Africa Dev Team 
 * @copyright	Copyright (c) 2018 - 2019, Compassion.
 * @license		https://www.compassion-africa.org/user_guide/license.html
 * @link		https://www.compassion-africa.org
 * @since		Version 1.0
 * @filesource
 */


if ( ! function_exists('get_access'))
{
		function get_access($phrase = '',$parent_phrase="",$visibility="1") {
		$CI	=&	get_instance();
		$CI->load->database();
			
		
		//$login_type_id = $CI->db->get_where("login_type",array("name"=>$login_type))->row()->login_type_id;
		
		$derivative_id = 0;
		
		if($parent_phrase!=""){
			
			$check_parent = $CI->db->get_where("entitlement",
			array("name"=>$parent_phrase,"visibility"=>$visibility))->num_rows();
			
			if($check_parent > 0){
				$derivative_id = $CI->db->get_where("entitlement",
				array("name"=>$parent_phrase,"visibility"=>$visibility))->row()->entitlement_id;
			}else{
				$data['name'] = $parent_phrase;
				$data['visibility'] = $visibility;
				$data['derivative_id'] = 0;
				
				$CI->db->insert('entitlement' , $data);	
				
				$derivative_id =  $CI->db->insert_id();
			}
			
			
		}
		
		$check_phrase	=	$CI->db->get_where('entitlement' , 
			array('name' => $phrase,"visibility"=>$visibility,'derivative_id'=>$derivative_id));//->row()->phrase;
		
		if ( $check_phrase->num_rows() == 0){
			
			$data['name'] = $phrase;
			$data['visibility'] = $visibility;
			$data['derivative_id'] = $derivative_id;
			
			
			$CI->db->insert('entitlement' , $data);
		}	

		
		return $phrase;
	}
}

// ------------------------------------------------------------------------
/* End of file access_profiling_helper.php */
/* Location: ./application/helpers/access_profiling_helper.php */