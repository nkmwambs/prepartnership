	<div class='col-xs-12 summary_headers'>
		<h2><?=get_phrase('leads_profile_information');?></h2>
	</div>

	<?php 
		foreach($lead_profile_information as $lead_field => $lead_info){
	?>
		<div class='col-xs-4'>
			<div class="form-group">
				<span class='info_labels'>
					<?=get_phrase($lead_field);?>:
				</span>

				<?=$lead_info;?></div>
			</div>
	<?php		
		}
	?>
						