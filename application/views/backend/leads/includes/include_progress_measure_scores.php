<table class='table table-striped datatable'>
                                <thead>
                                    <tr>
                                        <th rowspan='2'>Progress Measures</th>
                                        <th colspan='4' style='text-align:center;'>Scores</th>
                                    </tr>
                                    <tr>
                                        <!--Table header
                                        Sort the array of milestones to ensure they arranged as IA , M1 M2 ,M3 and summative
                                        -->                                                
                                        <?ksort($milestone_names);?>
                                        <?php foreach($milestone_names as $milestone_name){?>
                                        <th><?=$milestone_name;?> (%)</th> 
                                        <?php }?>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                    $sums = []; 
                                    foreach($lead_assessment_information['progress_measure_aggregate_score'] as $progress_measure_record){?>
                                    <tr>
                                        <td><?=array_column($progress_measure_record,'progress_measure_name')[0];?></td>
                                        
                                        <?php 

                                        foreach($milestone_names as $milestone_id=>$milestones){
                                            $weighted_score = isset($progress_measure_record[$milestone_id]['weighted_score'])?$progress_measure_record[$milestone_id]['weighted_score']:0;

                                            $sums[$milestone_id] = $weighted_score;
                                        ?>   
                                            <td><?=$weighted_score;?></td>
                                        <?php }?>
                                    </tr>
                                <?php }?>
                                   
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td><?=get_phrase('avarage_score');?> (%)</td>
                                        <?php foreach($milestone_names as $milestone_id=>$milestone_name){?>
                                            <td>
                                                <?php 
                                                    $array_milestones_in_a_measure = array_column($lead_assessment_information['progress_measure_aggregate_score'],$milestone_id); 
                                                    $array_of_weighted_score_in_a_measure =  array_column($array_milestones_in_a_measure,'weighted_score');
                                                    $sum_of_weighted_score_in_a_measure = array_sum($array_of_weighted_score_in_a_measure);

                                                    $avg_of_milestone = $sum_of_weighted_score_in_a_measure/ count($array_milestones_in_a_measure);

                                                    //echo $assessment_data['compute_aggregate_assessment_score'][$milestone_id];

                                                    echo $avg_of_milestone;
                                                ?>
                                            </td>
                                        <?php }?>

                                    </tr>
                                </tfoot>
                            </table>