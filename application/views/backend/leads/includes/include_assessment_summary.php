
	<div class='col-xs-12 summary_headers'>
		<h2><?=get_phrase('assessment');?></h2>
	</div>

		<div class="col-xs-6">
			<div class="form-group">
				<label class="control-label" for="assessment_stage"><?=get_phrase('assessment_stage');?>:</label> <?=$lead_assessment_information['milestone_name'];?>				
			</div>
		</div>

		<div class="col-xs-6">
			<div class="form-group">
				<label class="control-label" for="completion_date"><?=get_phrase('last_updated_date');?>: </label> <?=$lead_assessment_information['completion_date'];?>		
			</div>
		</div>
							
		<div class="col-xs-6">
			<div class="form-group">
				<label class="control-label" for="progress_status"><?=get_phrase('progress_status');?>: </label> <?=$lead_assessment_information['status_label'];?>		
			</div>
		</div>
							
		<div class="col-xs-6">
			<div class="form-group">
				<label class="control-label" for="updated_by"><?=get_phrase('last_updated_by');?> : </label> <?=$lead_assessment_information['last_modified_by'];?>		
			</div>
		</div>


