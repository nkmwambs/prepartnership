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
                                                <th><?=$connect_stage_parameter;?></th>
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
                                    <!-- <tr>
                                        <td>Measure 1</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>

                                    </tr>

                                    <tr>
                                        <td>Measure 2</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                 
                                    </tr>

                                    <tr>
                                        <td>Measure 3</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                               
                                    </tr> -->
                                </tbody>
                                <tfoot>
                                     <tr>
                                        <td>Average Score</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                      
                                    </tr>
                                </tfoot>
                              </table>