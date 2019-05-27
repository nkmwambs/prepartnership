<div class='row'>
	<div class='col-xs-12'>
		<?php
			//$arr = $this->db->field_data('lead_bio_fields');
			$array_of_fields_schema = $this->db->field_data('lead_bio_fields');
			
			$field_names = array_column($array_of_fields_schema, 'name');
			$primary_keys_array = array_column($array_of_fields_schema, 'primary_key');
				
			$field_keys = array_combine($field_names, $primary_keys_array);
				
			echo $primary_key_field = array_search(1, $field_keys);
		?>
		<!-- <button class='btn btn-info <?php echo get_access('test_button','dashboard');?>'>TEST BUTTON</button> -->
	</div>
</div>