<?php 

print_r($test); 
//print_r($human_readable_fields);
extract($assessment_data);


include 'includes/include_styles.php';?>

<div class='row'>
	<div class="col-xs-12">
		<form id="prepartnership_assessment_form" method="post" action="" class="form-wizard validate">

			<?php include 'includes/include_form_wizard.php';?><hr>

					<div class="tab-content">

						<div class="tab-pane active" id="tab-<?=$assessment_milestone_id;?>">
						
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
										<button class="btn btn-primary" name="btnSubmit" id="btnSubmit" >
											<?=get_phrase('submit');?>
										</button>
									</div>
								</div>
							</div>

						</div><!--//tab-pane-->

					</div><!--//tab-content-->

		</form><!--//form-->
	</div>
</div>

<?php include 'includes/include_js_script.php';?>

