<?php 
//print_r($assessment_data);

extract($assessment_data);

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
                            <table class='table table-striped datatable'>
                                <thead>
                                    <tr>
                                        <th rowspan='2'>Progress Measures</th>
                                        <th colspan='4' style='text-align:center;'>Scores</th>
                                    </tr>
                                    <tr>
                                        <th>Initial Assessment</th>
                                        <th>Mid 1 Assessment</th>
                                        <th>Mid 2 Assessment</th>
                                        <th>Mid 3 Assessment</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
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
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>Avarage Score</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                </tfoot>
                            </table>    
                        </div>
                    </div>

                    <div class='row'>
                        <div class='col-xs-12'>
                              <table class='table table-striped table-bordered'>
                                <thead>
                                    <tr>
                                        <th rowspan='3'>Progress Measure</th>
                                        <th colspan='10'>Connect Stage</th>
                                        
                                    </tr>
                                    <tr>
                                        <th colspan='5'>Stage 1</th>
                                        <th colspan='5'>Stage 2</th>
                                    </tr>
                                    <tr>
                                        <th>Connect Param 1</th>
                                        <th>Connect Param 1</th>
                                        <th>Connect Param 1</th>
                                        <th>Connect Param 1</th>
                                        <th>Connect Param 1</th>


                                        <th>Connect Param 1</th>
                                        <th>Connect Param 1</th>
                                        <th>Connect Param 1</th>
                                        <th>Connect Param 1</th>
                                        <th>Connect Param 1</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Measure 1</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>

                                    <tr>
                                        <td>Measure 1</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>

                                    <tr>
                                        <td>Measure 1</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                     <tr>
                                        <td>Average Score</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>0</td>
                                    </tr>
                                </tfoot>
                              </table>  
                        </div>
                    </div>
                    
                </div>
            </div>    

        </form>    
    </div>
</div>