<table class='table table-striped table-bordered'>
                                <thead>
                                    <tr>
                                        <th rowspan='3'><?=get_phrase('progress_measure');?></th>
                                        <th colspan='<?=count($stage_header_colspan_array['connect_parameter_names']);?>'>Connect Stage</th>
                                        
                                    </tr>
                                    <tr>
                                        <?php foreach($connect_stage_names as $connect_stage_id=>$connect_stage_name){?>
                                            <th colspan='<?=count($array_of_connect_stage_parameters[$connect_stage_id]);?>'><?=$connect_stage_name;?></th>
                                        <?php }?>
                                    </tr>
                                    <tr>

                                        <?php 
                                            foreach($connect_stage_names as $connect_stage_id=>$connect_stage_name){
                                                foreach($array_of_connect_stage_parameters[$connect_stage_id] as $connect_stage_parameter){
                                        ?>  
                                                <th><?=$connect_stage_parameter;?> (%)</th>
                                        <?php 
                                                }
                                            }
                                        ?>
                                    </tr>
                                </thead>
                                <tbody>

                                <?php 
                                    foreach($lead_assessment_information['connect_measures_aggregate_score'] as $progress_measure){
                                        foreach($progress_measure as $connect_stage_id => $connect_stage_and_parameters){
                                ?>
                                        <tr>
                                            <td><?=$connect_stage_and_parameters['progress_measure_name']?></td>
                                            <?php foreach($array_of_connect_stage_parameters as $inner_connect_stage_id => $parameter_name_and_id){?>
                                                <?php foreach(array_keys($parameter_name_and_id) as $connect_parameter_id){?>
                                                    <td><?=isset($progress_measure[$connect_stage_id]['connect_stage_parameters'][$connect_parameter_id]['progress_measure_score'])?$progress_measure[$connect_stage_id]['connect_stage_parameters'][$connect_parameter_id]['progress_measure_score']:0;?></td>
                                                <?php }?>
                                            <?php }?>    

                                            
                                            
                                        </tr>
                                <?php 
                                        }
                                    }
                                ?>
                                    
                                </tbody>
                                <tfoot>
                                     <tr>
                                        <td><?=get_phrase('average_score');?> (%)</td>
                                        <?php 
                                            foreach($connect_stage_names as $connect_stage_id=>$connect_stage_name){
                                                foreach($array_of_connect_stage_parameters[$connect_stage_id] as $connect_parameter_id=>$connect_stage_parameter){
                                        ?>  
                                                <td>
                                                    <?php 
                                                        $array_of_connect_stage_and_connect_parameter = array_column($lead_assessment_information['connect_measures_aggregate_score'],$connect_stage_id);
                                                        $array_of_connect_parameter_and_score = array_column($array_of_connect_stage_and_connect_parameter,'connect_stage_parameters');
                                                        $connect_parameters_array = array_column($array_of_connect_parameter_and_score,$connect_parameter_id);
                                                        $progress_measure_weighted_scores = array_column($connect_parameters_array,'progress_measure_score');
                                                        
                                                        $sum_of_scores = array_sum($progress_measure_weighted_scores);
                                                        $size_of_scores = sizeof($progress_measure_weighted_scores);
                                                        
                                                        $avg_score = $sum_of_scores > 0 ? $sum_of_scores/ $size_of_scores : 0;

                                                        echo number_format($avg_score,2);
                                                    ?>
                                                </td>
                                        <?php 
                                                }
                                            }
                                        ?>
                                      
                                    </tr>
                                </tfoot>
                              </table>