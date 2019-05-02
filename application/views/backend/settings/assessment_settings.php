<div class='row'>
	<div class="col-xs-12">
			
				<div class="tabs-vertical-env">
				
					<ul class="nav tabs-vertical"><!-- available classes "right-aligned" -->
						<li class="active"><a href="#leads_bio_fields" data-toggle="tab"><?=get_phrase('leads_bio_fields');?></a></li>
						<li><a href="#connect_progress_measure" data-toggle="tab"><?=get_phrase('connect_progress_measure');?></a></li>
						<li><a href="#assessment_progress_measure" data-toggle="tab"><?=get_phrase('assessment_progress_measure');?></a></li>
						<li><a href="#assessment_milestone" data-toggle="tab"><?=get_phrase('assessment_milestone');?></a></li>
					</ul>
					
					<div class="tab-content">
						<div class="tab-pane active" id="leads_bio_fields">
							<p><?=$lead_bio_fields_output;?></p>				
						</div>
						<div class="tab-pane" id="connect_progress_measure">
							<p><?=$connenct_progress_measures;?> </p>
						</div>
						<div class="tab-pane" id="assessment_progress_measure">
							<p><?=$progress_measures;?> </p>
						</div>
						<div class="tab-pane" id="assessment_milestone">
							<p><?=$assessment_milestones;?></p>
						</div>
					</div>
					
				</div>	
			
			</div>
</div>
