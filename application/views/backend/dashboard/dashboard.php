<div class='row'>
	<div class='col-xs-12'>
		<?php
		
			$not_to_show_object = $this->db->select(array('lead_bio_info_column'))->get_where('lead_bio_fields',
			array('show_field'=>0))->result_object();
			
			$hidden_fields = array_column($not_to_show_object,'lead_bio_info_column');
			
			$all_fields = array_column($this->db->field_data('leads_bio_information'),'name');
			
			
			print_r(array_diff($all_fields, $hidden_fields));
			
		?>
		<!-- <button class='btn btn-info <?php echo get_access('test_button','dashboard');?>'>TEST BUTTON</button> -->
	</div>
</div>