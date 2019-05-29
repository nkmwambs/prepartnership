<div class='row'>
	<div class='col-xs-12'>
		<?php
				$field_data = $this->db->field_data('lead_bio_fields');
				
				$field_name = array_column($field_data, 'name');
				$field_primary_key = array_column($field_data, 'primary_key');
				
				$combined = array_combine($field_name, $field_primary_key);
		
				$primary_key_field = array_search(1, $combined);
				
				echo $primary_key_field;
		?>
		
		<!-- <button class='btn btn-info <?php echo get_access('test_button','dashboard');?>'>TEST BUTTON</button> -->
	</div>
</div>