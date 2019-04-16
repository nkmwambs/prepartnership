<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	 
	function __construct(){
		parent::__construct();
		$this->load->database();
	}
	 
	public function index(){
		
		$page_data['account_type']	= "main";
		$page_data['page_name']	= "main_page";
		$this->load->view('backend/index',$page_data);
	}
	
private function load_library(){
		$this->load->library('utility_forms');
		return new Utility_forms();
	}
	
private function load_view($build_form,$fields,$form_type='multi_form'){
		$build_form->set_form_fields($fields);
		$page_data['output'] = $build_form->render_form($form_type);
		$page_data['account_type']	= "admin";
		$page_data['page_name']	= "settings";
		$this->load->view('backend/index',$page_data);		
	}

public function list_lead_bio(){
		
		$build_list = $this->load_library();
		
		$selected_columns = array("Field Name"=>"lead_bio_fields_name",
		'Data Type'=>"datatype_name","Is Field Unique?"=>"is_field_unique","Is Field Null?"=>"is_field_null",
		'default_value');
	
		$build_list->set_selected_fields($selected_columns,'lead_bio_fields_id');		
	
				
		$build_list->set_panel_title("Lead Bio Fields");
		
		$action = array(
			'add' 	=> array('href'=>'admin/add_lead_bio_fields'),
			'view' 	=> array('href'=>'admin/view_single_lead_bio'),
			'edit' 	=> array('href'=>'admin/edit_lead_bio_fields'),
			'delete'=> array('href'=>'admin/delete_lead_bio_fields')
		);
		
		$build_list->set_list_action($action);
		
		$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
		
		$build_list->set_table_join($join_array);
		
		$build_list->set_db_table("lead_bio_fields");
		
		$build_list->set_add_form();
		
		$page_data['output'] = $build_list->render_item_list();
		$page_data['account_type']	= "admin";
		$page_data['page_name']	= "settings";
		$this->load->view('backend/index',$page_data);
	}
public function view_assessment_milestones()
{
	
	$build_list = $this->load_library();
	
	$selected_columns = array("Milestone Name"=>"milestone_name",
	'When'=>"assessment_period_in_days","Review Status"=>"assessment_review_status","User Customized Review Status"=>"user_customized_review_status");

	$build_list->set_selected_fields($selected_columns,"assessment_milestones_id");	
	$build_list->set_panel_title("Assessment Milestones");
	
	$action = array(
		'add' 	=> array('href'=>'admin/add_assessment_milestone'),
		'view' 	=> array('href'=>'admin/view_single_assessment_milestones'),
		'edit' 	=> array('href'=>'admin/edit_assessment_milestone'),
		'delete'=> array('href'=>'admin/delete_assessment_milestone')
	);
	
	$build_list->set_list_action($action);
	
	//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
	
	//$build_list->set_table_join($join_array);
	
	$build_list->set_db_table("assessment_milestones");
	
	$build_list->set_add_form();
	
	$page_data['output'] = $build_list->render_item_list();
	$page_data['account_type']	= "admin";
	$page_data['page_name']	= "settings";
	$this->load->view('backend/index',$page_data);
}
public function view_single_assessment_milestones($table_name,$record_id)
{
	
	$build_form = $this->load_library();
	
	$selected_columns = array("Milestone Name"=>"milestone_name",
	'When'=>"assessment_period_in_days","Review Status"=>"assessment_review_status","User Customized Review Status"=>"user_customized_review_status");

	$build_form->set_selected_fields($selected_columns,"assessment_milestones_id");	
		
	$build_form->set_selected_fields($selected_columns,"assessment_milestones_id");
	
	//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
	
	//$build_form->set_table_join($join_array);
	
	$build_form->set_view_or_edit_mode('view');
	
	$build_form->set_panel_title("Assessment Milestone Details");
	
	$this->view_record_by_id($build_form,$table_name,$record_id);
}
public function view_compassion_connect_progress_measures()
{
	
	$build_list = $this->load_library();
	
	$selected_columns = array("Lead Score Criteria Parameter"=>"lead_score_parameter",
	'Lead Score Stage'=>"lead_score_stage");

	$build_list->set_selected_fields($selected_columns,"compassion_connect_mapping_id");	
	$build_list->set_panel_title("Compassion Connect Progress Measures");
	
	$action = array(
		'add' 	=> array('href'=>'admin/add_compassion_connect_progress_measure'),
		'view' 	=> array('href'=>'admin/view_single_connect_progress_measure'),
		'edit' 	=> array('href'=>'admin/edit_connect_progress_measure'),
		'delete'=> array('href'=>'admin/delete_connect_compassion_progress_measure')
	);
	
	$build_list->set_list_action($action);
	
	//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
	
	//$build_list->set_table_join($join_array);
	
	$build_list->set_db_table("compassion_connect_mapping");
	
	$build_list->set_add_form();
	
	$page_data['output'] = $build_list->render_item_list();
	$page_data['account_type']	= "admin";
	$page_data['page_name']	= "settings";
	$this->load->view('backend/index',$page_data);
}
public function view_single_connect_progress_measure($table_name,$record_id)
{
	$build_form = $this->load_library();
	
	
	$selected_columns = array("Lead Score Criteria Parameter"=>"lead_score_parameter",
	'Lead Score Stage'=>"lead_score_stage");

	$build_form->set_selected_fields($selected_columns,"compassion_connect_mapping_id");
	
	//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
	
	//$build_form->set_table_join($join_array);
	
	$build_form->set_view_or_edit_mode('view');
	
	$build_form->set_panel_title('View Progress Measure');
	
	$this->view_record_by_id($build_form,$table_name,$record_id);
}
public function edit_connect_progress_measure($table_name,$record_id){
	$build_form = $this->load_library();
		
	$selected_columns = array("Lead Score Criteria Parameter"=>"lead_score_parameter",
	'Lead Score Stage'=>"lead_score_stage");
	
	$build_form->set_selected_fields($selected_columns,"compassion_connect_mapping_id");
		
		//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
		
		//$build_form->set_table_join($join_array);
		
		$build_form->set_view_or_edit_mode('edit');
		
		$build_form->set_panel_title('Edit Connect Progress Measure');
		
		$build_form->set_dropdown_element_type(array('lead_score_stage',array(
					'0'=>array('option'=>'No'),
					'1'=>array('option'=>'Yes','selected'=>'selected')
					)
				)
			);
	
		$this->view_record_by_id($build_form,$table_name,$record_id);
}
public function edit_assessment_progress_measure($table_name,$record_id){
		$build_form = $this->load_library();
		
		$selected_columns = array("Progress Measure"=>"Progress_Measure_title",
		'Tools Of Verification'=>"verification_tool","Progress Measure Weight"=>"weight","CC Mapping"=>"compassion_connect_mapping");
	
		$build_form->set_selected_fields($selected_columns,"assessment_progress_measure_id");
		
		$build_form->set_view_or_edit_mode('edit');
		
		$build_form->set_panel_title('Edit Progress Measure');
		
	
	    $build_form->set_dropdown_element_type(array('weight',array(
					'0'=>array('option'=>'Zero'),
					'1'=>array('option'=>'One'),
					'2'=>array('option'=>'Two','properties'=>array('selected'=>'selected')),
					'3'=>array('option'=>'Three')
					)
			));
			
			
		$this->view_record_by_id($build_form,$table_name,$record_id);
}

public function view_record_by_id($build_form,$table_name,$record_id)
{
	$build_form->set_where_clause(array($table_name."_id"=>$record_id));
	
	$build_form->set_db_table($table_name);
	
	//$build_form->set_hide_save_button($display_save_btn);

	$page_data['output'] = $build_form->render_form('single_view_form');
	$page_data['account_type']	= "admin";
	$page_data['page_name']	= "settings";
	$this->load->view('backend/index',$page_data);
}

public function edit_lead_bio_fields($table_name,$record_id){
		$build_form = $this->load_library();
		
		
		$selected_columns = array("Field Name"=>"lead_bio_fields_name",
		'Data Type'=>"datatype_name","Is Field Unique?"=>"is_field_unique","Is Field Null?"=>"is_field_null",
		'Default Value'=>'default_value');
	
		$build_form->set_selected_fields($selected_columns,'lead_bio_fields_id');
		
		$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
		
		$build_form->set_table_join($join_array);
		
		$build_form->set_view_or_edit_mode('edit');
		
		$build_form->set_panel_title('Edit Leads Bio Field');
		
		$build_form->set_element_type(array('is_field_unique',
			array('select'=>array(
				'options'=>array(
					'0'=>array('option'=>'No'),
					'1'=>array('option'=>'Yes','selected'=>'selected')
					)
				)
			)));
			
		$build_form->set_element_type(array('is_field_null',
			array('select'=>array(
				'options'=>array(
					'0'=>array('option'=>'No'),
					'1'=>array('option'=>'Yes','selected'=>'selected')
					)
				)
			)));	
		
		$this->view_record_by_id($build_form,$table_name,$record_id);
	}
public function edit_assessment_milestone($table_name,$record_id){
	$build_form = $this->load_library();
		
	$selected_columns = array("Milestone Name"=>"milestone_name",
	'When'=>"assessment_period_in_days","Review Status"=>"assessment_review_status","User Customized Review Status"=>"user_customized_review_status");
	
	$build_form->set_selected_fields($selected_columns,"assessment_milestones_id");
		
		//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
		
		//$build_form->set_table_join($join_array);
		
		$build_form->set_view_or_edit_mode('edit');
		//$build_form->set_hide_save_button();
		
		$build_form->set_panel_title('Edit Assessment Milestone');
		
		/*$build_form->set_element_type(array('lead_score_stage',
			array('select'=>array(
				'options'=>array(
					'0'=>array('option'=>'No'),
					'1'=>array('option'=>'Yes','selected'=>'selected')
					)
				)
			)));*/
	
		$this->view_record_by_id($build_form,$table_name,$record_id);
}
public function view_progress_measures()
{
	
	$build_list = $this->load_library();
	
	$selected_columns = array("Progress Measure"=>"Progress_Measure_title",
	'Tools Of Verification'=>"verification_tool","Progress Measure Weight"=>"weight","CC Mapping"=>"compassion_connect_mapping");

	$build_list->set_selected_fields($selected_columns,"assessment_progress_measure_id");		

			
	$build_list->set_panel_title("Assessment Progress Measure");
	
	$action = array(
		'add' 	=> array('href'=>'admin/add_assessment_progress_measure'),
		'view' 	=> array('href'=>'admin/view_single_assessment_progress_measure'),
		'edit' 	=> array('href'=>'admin/edit_assessment_progress_measure'),
		'delete'=> array('href'=>'admin/delete_assessment_progress_measure')
	);
	
	$build_list->set_list_action($action);
	
	//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
	
	//$build_list->set_table_join($join_array);
	
	$build_list->set_db_table("assessment_progress_measure");
	
	$build_list->set_add_form();
	
	$page_data['output'] = $build_list->render_item_list();
	$page_data['account_type']	= "admin";
	$page_data['page_name']	= "settings";
	$this->load->view('backend/index',$page_data);
}
public function view_single_assessment_progress_measure($table_name,$record_id)
{
	$build_form = $this->load_library();
	
	
	$selected_columns = array("Progress Measure"=>"Progress_Measure_title",
		'Tools Of Verification'=>"verification_tool","Progress Measure Weight"=>"weight","CC Mapping"=>"compassion_connect_mapping");

	$build_form->set_selected_fields($selected_columns,"assessment_progress_measure_id");
	
	//$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
	
	//$build_form->set_table_join($join_array);
	
	$build_form->set_view_or_edit_mode('view');
	
	$build_form->set_panel_title('View Progress Measure');
	
	$this->view_record_by_id($build_form,$table_name,$record_id);
}		
public function view_single_lead_bio($table_name,$record_id){
		$build_form = $this->load_library();
		
		
		$selected_columns = array("Field Name"=>"lead_bio_fields_name",
		'Data Type'=>"datatype_name","Is Field Unique?"=>"is_field_unique","Is Field Null?"=>"is_field_null",
		'default_value');
	
		$build_form->set_selected_fields($selected_columns,'lead_bio_fields_id');
		
		$join_array = array('datatype'=>array('lead_bio_fields.datatype_id','datatype.datatype_id'));
		
		$build_form->set_table_join($join_array);
		
		$build_form->set_view_or_edit_mode('view');
		
		$build_form->set_panel_title('View Leads Bio Field');
		
		$this->view_record_by_id($build_form,$table_name,$record_id);
	}

public function add_assessment_milestone()
{
		
		$build_form = $this->load_library();
		
		$fields[] = array(
				'label'		=> 'Assessment Milestone Name:',
				'element'	=> 'input',
				'properties'=> array('id'=>'','class'=>'')
		);
		
		$fields[] = array(
				'label'		=> 'Period Needed to Complete(in months)',
				'element'	=> 'select',
				'properties'=> array('id'=>'','class'=>''),
				'options'	=> array(
					'1'	=> array('option'=>'1'),
					'2'	=> array('option'=>'2'),
					'3'	=> array('option'=>'3'),
					'4'	=> array('option'=>'4'),
					'5'	=> array('option'=>'5'),
					'6'	=> array('option'=>'6'),
					'7'	=> array('option'=>'7'),
					'8'	=> array('option'=>'8'),
					'9'	=> array('option'=>'9'),
					'10'=> array('option'=>'10'),
					'11'=> array('option'=>'11'),
					'12'=> array('option'=>'12')
				)
				
			);
		
		$fields[] = array(
				'label'		=> 'User Customized Review Status',
				'element'	=> 'input',
				'properties'=> array('id'=>'','class'=>''),
		);
	    $build_form->set_view_or_edit_mode('add');
		$build_form->set_panel_title('Add Milestone');
		$build_form->set_form_id('frm_add_milestone');
		
		$this->load_view($build_form,$fields,'single_form');
		
		/*
		 
		 *<select>
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="mercedes">Mercedes</option>
  <option value="audi">Audi</option>
</select>
		 * */

}	 
public function add_lead_bio_fields()
{
		
		$build_form = $this->load_library();
		
		$fields[] = array(
				'label'		=> 'Field Name',
				'element'	=> 'input',
				'properties'=> array('id'=>'','class'=>'')
		);
		
		$fields[] = array(
				'label'		=> 'Data Type',
				'element'	=> 'select',
				'properties'=> array('id'=>'','class'=>''),
				'options'	=> array(
					'1'	=> array('option'=>'Whole Number'),
					'2'	=> array('option'=>'Decimal Number'),
					'3'	=> array('option'=>'Date & Time'),
					'4'	=> array('option'=>'Text')
				)
			);
		
		$fields[] = array(
				'label'		=> 'Field Unique?',
				'element'	=> 'select',
				'properties'=> array('id'=>'','class'=>''),
				'options'	=> array(
					'1'=>array('option'=>'Yes'),
					'0'=>array('option'=>'No')
				)
		);
		
		$fields[] = array(
				'label'		=> 'Can be Null?',
				'element'	=> 'select',
				'properties'=> array('id'=>'','class'=>''),
				'options'	=> array(
					'1'=>array('option'=>'Yes'),
					'0'=>array('option'=>'No')
				)
		);
		
		$fields[] = array(
				'label'		=> 'Default Value',
				'element'	=> 'input',
				'properties'=> array('id'=>'','class'=>'')
		);
		
		$build_form->set_view_or_edit_mode('add');
		$build_form->set_panel_title('Leads Bio Information');
		$build_form->set_form_id('frm_bio');
		
		
		$this->load_view($build_form,$fields);

}
public function add_assessment_progress_measure(){

		$build_form = $this->load_library();
		
		$fields[] = array(
			'label'=>'Progress Measure Title',
			'element'=>'input',
			'properties'=>array('id'=>'','class'=>'')
		);
		
		$fields[] = array(
			'label'=>'Verification Tools',
			'element'=>'input',
			'properties'=>array('id'=>'','class'=>'')
		);
		
		$fields[] = array(
			'label'=>'Method of assessment',
			'element'=>'input',
			'properties'=>array('id'=>'','class'=>'')
		);
		
		$fields[] = array(
			'label'=>'Weight',
			'element'=>'select',
			'properties'=>array('id'=>'','class'=>''),
			'options' => array(
				'1'=>array('option'=>1),
				'2'=>array('option'=>2),
				'3'=>array('option'=>3),
				'4'=>array('option'=>4),
				'5'=>array('option'=>5),
				'6'=>array('option'=>6),
				'7'=>array('option'=>7),
				'8'=>array('option'=>8),
				'9'=>array('option'=>9),
				'10'=>array('option'=>10),
			)
		);
		
		$fields[] = array(
			'label'=>'Connect Mapping',
			'element'=>'select',
			'properties'=>array('id'=>'','class'=>''),
			'options' => array(
				'0'=>array('option'=>'No Connect Match'),
				'1'=>array('option'=>'Lead Score Criteria - Stage 1: Statement Of Faith Compatibility'),
				'2'=>array('option'=>'Lead Score Criteria - Stage 1: Commitment To Child Ministry'),
				'3'=>array('option'=>'Lead Score Criteria - Stage 1: Strategic Location for Compassion'),
				'4'=>array('option'=>'Lead Score Criteria - Stage 2 - Stage 1: Denomination'),
				'5'=>array('option'=>'Lead Score Criteria - Stage 2: Legal Registration'),
				'6'=>array('option'=>'Lead Score Criteria - Stage 2: Physical Environment'),
				'7'=>array('option'=>'Lead Score Criteria - Stage 2: Child Enrollment Capacity'),
				'8'=>array('option'=>'Lead Score Criteria - Stage 2: Commitment To Christian Staff'),
				'9'=>array('option'=>'Lead Score Criteria - Stage 2: Understands Context'),
				'10'=>array('option'=>'Lead Score Criteria - Stage 2: Commitment To Ongoing Learning')
				
			)
		);
		$build_form->set_view_or_edit_mode('add');
		$build_form->set_panel_title('Assessment Progress Measure');
		
		$this->load_view($build_form, $fields);
	}
public	function add_compassion_connect_progress_measure(){
		
		$build_form = $this->load_library();
		
		$fields[] = array(
			'label'=>'Lead Score Criteria Parameter',
			'element'=>'input',
			'properties'=>array('id'=>'','class'=>'')
		);
		
		$fields[] = array(
			'label'=>'Connect Lead Score Stage',
			'element'=>'select',
			'properties'=>array('id'=>'','class'=>''),
			'options'=>array(
				'1'=>array('option'=>'Stage 1'),
				'2'=>array('option'=>'Stage 2')
			)
		);
		
		$build_form->set_panel_title('Connect Lead Score Parameters');
		$build_form->set_view_or_edit_mode('add');
		
		$this->load_view($build_form, $fields);
	}
}
