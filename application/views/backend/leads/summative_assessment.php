<?php 
print_r($assessment_data);

extract($assessment_data);

$disabled = '';
$completed = '';
if($lead_assessment_information['is_completed'] == 1){
	$disabled = "disabled='disabled'";
	$completed = 'completed';
}

?>

<div class='row'>
    <div class='col-xs-12'>
        <form id="prepartnership_assessment_form" method="post" action="" class="form-wizard validate">
            <?php include 'includes/include_form_wizard.php';?><hr>

            <div class="tab-content">
				<div class="tab-pane active" id="tab-<?=$assessment_milestone_id;?>">

                    <div class="row">
                        <div class='col-xs-12' style='text-align:center;'>
                            Progress Measure Scores
                        </div>
                    </div>

                    <div class="row">
                        <div class='col-xs-12'>
                            <?php include 'includes/include_progress_measure_scores.php';?>    
                        </div>
                    </div>

                    <div class='row'>
                        <div class='col-xs-12'>
                              <?php include 'includes/include_connect_parameter_score.php';?>  
                        </div>
                    </div>

                    <div class='row'>
                        <div class='col-xs-12'>
                            <?=include 'includes/include_comment.php';?>
                        </div>
                    </div>

                    <div class='row'>
						<div class="col-xs-12">
							<div class="form-group">	
								<button <?=$disabled;?> class="btn btn-success" name="btnSubmit" id="btnSubmit" >
									<?=get_phrase('mature');?>
								</button>

                                <button <?=$disabled;?> class="btn btn-danger" name="btnSubmit" id="btnSubmit" >
									<?=get_phrase('close');?>
								</button>

							</div>
					    </div>						
                    </div>

                    
                </div>
            </div>    

        </form>    
    </div>
</div>