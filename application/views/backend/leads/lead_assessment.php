<?php 
//echo $this->uri->segment(3);
print_r($test); 
//print_r($assessment_data['lead_assessment_information']['assessment_id']);

extract($assessment_data);

//print_r($lead_assessment_information['next_assessment_milestone_id']);

$disabled = '';
$completed = '';
if($lead_assessment_information['is_completed'] == 1){
	$disabled = "disabled='disabled'";
	$completed = 'completed';
}

include 'includes/include_styles.php';?>

<div class='row'>
	<div class="col-xs-12">
		<form id="prepartnership_assessment_form" method="post" action="" class="form-wizard validate">

			<!--Form Hidden Fields -->
			<input type='hidden' id="assessment_id" name='assessment_id' value='<?=$lead_assessment_information['assessment_id'];?>'/>
			<input type='hidden' id="next_assessment_milestone_id" name='next_assessment_milestone_id' value='<?=$lead_assessment_information['next_assessment_milestone_id'];?>'/>

			<?php include 'includes/include_form_wizard.php';?><hr>

					<div class="tab-content">

						<div class="tab-pane active" id="tab-<?=$assessment_milestone_id;?>">
						
						<?php if( isset($lead_assessment_information['assessment_result']) && count((array)$lead_assessment_information['assessment_result']) > 0 ){?>

							<div class='row'>
								<div class='col-xs-12'>
									<?php include 'includes/include_lead_information.php';?>
								</div>
							</div>

							<hr>

							<div class='row'>
								<div class='col-xs-12'>
									<?php include 'includes/include_assessment_summary.php';?>
								</div>
							</div>
						
							<hr>

							<div class="row">
								<div class="col-xs-12">
									<?php include 'includes/include_assessment_result.php';?>
								</div>
							</div>
                    
							<div class='row'>
								<div class="col-xs-12">
									<?php include 'includes/include_comment.php';?>
								</div>
							</div>

							<div class='row'>
								<div class="col-xs-12">
									<div class="form-group">	
										<button <?=$disabled;?> class="btn btn-primary" name="btnSubmit" id="btnSubmit" >
											<?=get_phrase('submit');?>
										</button>
									</div>
								</div>
							</div>

						<?php 
						}else{
						?>	
							<div class='row'>
								<div class="col-xs-12" style='text-align:center;'>
									<span class='label label-danger'>Assessment has not been initiated</span>
								</div>
							</div>		
						<?php	
						}
						?>		

						</div><!--//tab-pane-->

					</div><!--//tab-content-->

		</form><!--//form-->
	</div>
</div>

<?php include 'includes/include_js_script.php';?>