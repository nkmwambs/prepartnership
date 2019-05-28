<div class='row'>
	<div class='col-xs-12'>
		<?php
			
			$count = 5;
			
			$aliases_range = range('a','z'); 
			
			$chunks = array_chunk($aliases_range, $count);
			
			print_r($chunks[0]);
		?>
		<!-- <button class='btn btn-info <?php echo get_access('test_button','dashboard');?>'>TEST BUTTON</button> -->
	</div>
</div>