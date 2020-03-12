<?php 
print_r($assessment_data['lead_assessment_information']['connect_measures_aggregate_score']);

extract($assessment_data);

$milestone_names = [];

foreach($lead_assessment_information['progress_measure_aggregate_score'] as $progress_measure){
   foreach($progress_measure as $milestone_id=>$progress_measure_record){
        $milestone_names[$milestone_id] = $progress_measure_record['milestone_name'];
   }
}

$connect_stage_names = [];

foreach($lead_assessment_information['connect_measures_aggregate_score'] as $progress_measure){
    foreach($progress_measure as $connect_stage_id=>$progress_measure_record){
         $connect_stage_names[$connect_stage_id] = $progress_measure_record['connect_stage_name'];
    }
 }

 $array_of_connect_stage_parameters = [];
 $stage_header_colspan_array = [];

 foreach($lead_assessment_information['connect_measures_aggregate_score'] as $progress_measure){

    foreach($progress_measure as $connect_stage_id=>$connect_stage_and_parameter){
        foreach ($connect_stage_and_parameter['connect_stage_parameters'] as $connect_parameter_id => $connect_parameter_and_score) {
            $array_of_connect_stage_parameters[$connect_stage_id][$connect_parameter_id] = $connect_parameter_and_score['connect_parameter_name'];   
            $stage_header_colspan_array['connect_parameter_names'][$connect_parameter_id] = $connect_parameter_and_score['connect_parameter_name'];   
        }
    }

 }

 //echo $stage_header_colspan;
//print_r($array_of_connect_stage_parameters);

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

                    <div class='row'>
						<div class='col-xs-12'>
						    <?php include 'includes/include_lead_information.php';?>
						</div>
					</div>

                    <hr/>

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