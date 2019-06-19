

<div class='row'>
<div class="col-xs-12">
	<form id="rootwizard-2" method="post" action="" class="form-wizard validate">

		<div class="steps-progress">
			<div class="progress-indicator"></div>
		</div>

		<ul>
			<li class="completed">
				<a href="#tab2-1" data-toggle="tab"><span>IA</span>Initial Assessment</a>
			</li>
			<li class="active">
				<a href="#tab2-2" data-toggle="tab"><span>M1</span>Mid Assessment One</a>
			</li>
			<li>
				<a href="#tab2-3" data-toggle="tab"><span>M2</span>Mid Assessment Two</a>
			</li>
			<li>
				<a href="#tab2-4" data-toggle="tab"><span>M3</span>Mid Assessment Three</a>
			</li>
			<li>
				<a href="#tab2-5" data-toggle="tab"><span>SA</span>Summative</a>
			</li>
		</ul>
		<hr>
		<div class="panel panel-info" data-collapsed="0">

			<!-- panel head -->
			<div class="panel-heading">
				<div class="panel-title">
					Lead
				</div>

			</div>

			<!-- panel body -->
			<div class="panel-body">

				<div class="tab-content">
					<!-- The Static Bio information Fields-->

					<div class="row">

						<h2>Leads Profile Information</h2>
						
						<div class="col-xs-4">
							<div class="form-group">
								<label class="control-label" for="Lead_name">Lead Name: </label><span>Enchoro Munyi PCEA</span>

							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group">
								<label class="control-label" for="Lead_name">Phone Contants: </label><span>073455567/073390998</span>

							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group">
								<label class="control-label" for="Lead_name">Mail Address: </label><span>Ngong Town</span>

							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group">
								<label class="control-label" for="Lead_name">Pastor's name: </label><span>Rev. Diba</span>

							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group">
								<label class="control-label" for="Lead_name">Email Address: </label><span>enchoromunyi@hotmail.com</span>

							</div>
						</div>

						<div class="col-xs-4">
							<div class="form-group">
								<label class="control-label" for="Lead_name">Land size </label><span> Two acres </span>

							</div>
						</div>

						<div class="col-xs-4">
							<div class="form-group">
								<label class="control-label" for="Lead_name">Plot No: </label><span>Ng/west/20167</span>

							</div>
						</div>
						<div class="col-xs-4">
							<div class="form-group">
								<label class="control-label" for="Lead_name">Congragation size: </label><span>1000</span>

							</div>
						</div>

					</div>
					<hr>
					<!--Changing content based on assessment-->

					<div class="tab-pane active" id="tab2-1">

						<div class="row">
							<h2>Assessment</h2>

							<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label" for="assessment_stage">Assessment Stage:</label> Initial Assessment
									
								</div>
							</div>

							<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label" for="completion_date">Completion Date: </label> 31/12/2020
									
								</div>
							</div>
							
							<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label" for="progress_status">Progress Status: </label> Initial Assessment In-progress
									
								</div>
							</div>
							
							<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label" for="updated_by">Updated by : </label> Elkana Gitere
									
								</div>
							</div>

						</div>
						
						<hr>
					<div class="row">
					<div class="col-xs-12">
						<table id='tbl_assessment_form' class="table table-striped">
							<thead>
								<tr style="font-style: italic;">
									<th><?=get_phrase("progress_measure");?></th>
									<th><?=get_phrase("verication_tools");?></th>
									<th><?=get_phrase("method_of_assessment");?></th>
									<th><?=get_phrase("score");?></th>
									<th><?=get_phrase("comment");?></th>
								</tr>
							</thead>
							
							<tbody>
												
								<tr>
									
									<td>1.Church has a documented and operational vision, mission & strategy for Ministry including C&Y</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="progress_measure1_tool"><?=get_phrase('functional_strategic_document');?> </option>
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select select2" multiple>
											<option value="method1"><?=get_phrase('records-review');?></option>
											<option value="method2"><?=get_phrase('focused_discussions');?></option>
											
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>	
								
								
								<tr>
									
									<td>2.Church has a well-defined and operational Leadership and Governance structure</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('documented_selection_process_for_ministry_leaders');?> </option>
											<option value="2"><?=get_phrase('church_organizational_chart');?> </option>
											
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="method1"><?=get_phrase('records-review');?></option>
											<option value="method2"><?=get_phrase('focused_discussions');?></option>
											
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>	
								
								<tr>
									
									<td>3.Church has operational Human Resource policies and guidelines</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('evidence_of_adherence_to_statutory_HR_structures');?> </option>
											<option value="2"><?=get_phrase('annual_financial_statement  ');?> </option>
											
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="method1"><?=get_phrase('records-review');?></option>
											<option value="method2"><?=get_phrase('focused_discussions');?></option>
											
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>	
								
								
								<tr>
									
									<td>4. Church has an adequate pool of qualified human resource for the Ministry (Employees and Volunteers)</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('availability_of_employees_and_volunteers_for_CY_ministry_in_the_church');?> </option>
											
											
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="method1"><?=get_phrase('records-review');?></option>
											<option value="method2"><?=get_phrase('focused_discussions');?></option>
											
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>		
								
								<tr>
									
									<td>5.Church has operational administration  and financial management procedures and policies</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('evidence_of_Operational_procedures_&_financial_records');?> </option>
											
											
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="method1"><?=get_phrase('records-review');?></option>
											<option value="method2"><?=get_phrase('focused_discussions');?></option>
											
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>			
													
								<tr>
									
									<td>6.Church has adequate physical infrastructure and space for all its ministries.</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('a_vailability_of_adequate_space');?> </option>
											<option value="1"><?=get_phrase('safe_child_environment');?> </option>
											
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											
											<option value="method2"><?=get_phrase('focused_discussions');?></option>
											<option value="method3"><?=get_phrase('observation');?> </option>
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>	
								
								<tr>
									
									<td>7.Church has sound Biblical doctrine and is implementing a strategy to reach out and disciple people of all ages</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('documented_statement_of_faith_or_constitution');?> </option>
											<option value="1"><?=get_phrase('evidence_of_operational_evangelism_&_discipleship Programs');?> </option>
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											
											<option value="method2"><?=get_phrase('focused_discussions');?></option>
											<option value="method3"><?=get_phrase('observation');?> </option>
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>	
								
								<tr>
									
									<td>8.Church is using church & community mobilization approaches for advocacy and networking in the community</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('evidence_of_church_&_community_mobilization_methodologies');?> </option>
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											
											<option value="method2"><?=get_phrase('observation');?></option>
											<option value="method3"><?=get_phrase('focused_discussions');?> </option>
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>						
															
								<tr>
									
									<td>9. Church participates in ongoing learning activities including ministry to   children and youth and Implements Action Plans</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('no_of_learning_activities_church_has_participated_in');?> </option>
											<option value="1"><?=get_phrase('percentage_of_plans_of_action_implemented');?> </option>
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="method1"><?=get_phrase('records_review');?></option>
											<option value="method2"><?=get_phrase('observation');?></option>
											<option value="method3"><?=get_phrase('focused_discussions');?> </option>
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>
								
																	
								<tr>
									
									<td>10.Church identifies and addresses prioritized needs of the whole person, including children living in poverty e.g. livelihoods, education, social justice. etc.</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('evidence_of_holistic_gospel_ministry_in_the_church');?> </option>
											
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											
											<option value="method2"><?=get_phrase('observation');?></option>
											<option value="method3"><?=get_phrase('focused_discussions');?> </option>
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>				
									
									
								<tr>
									
									<td>11.	Church has vibrant CY Ministry</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('evidence_of_CY_program_activities');?> </option>
											
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											
											<option value="method2"><?=get_phrase('observation');?></option>
											<option value="method3"><?=get_phrase('focused_discussions');?> </option>
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>	
								
								<tr>
									
									<td>12.	Evidence of envisioned & sensitized congregation and other stakeholders on Compassions’ CY Ministry</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('documented_no._of_congregation_sensitization_meetings_held');?> </option>
											<option value="1"><?=get_phrase('church_activity_program');?> </option>
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											
											<option value="method2"><?=get_phrase('observation');?></option>
											<option value="method3"><?=get_phrase('focused_discussions');?> </option>
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>	
								
								
								<tr>
									
									<td>13.	Church has good standing in the community</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('evidence_of_good_report_about_the_church');?> </option>
											
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											
											
											<option value="method1"><?=get_phrase('Interviews');?></option>
											<option value="method2"><?=get_phrase('FGDs_with_influencers');?></option>
											
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>	
								
								<tr>
									
									<td>14.	Church meets other PFM/Compassion Connect provisions and standards</td>
									 
									
									<td>
	                                     <select class="custom-select" multiple>
											<option value="1"><?=get_phrase('evidence_of_good_report_about_the_church');?> </option>
											
											
										 </select>
									</td>
									
									<td>
	                                     <select class="custom-select" multiple>
											
												<option value="method1"><?=get_phrase('Interviews');?></option>
											<option value="method2"><?=get_phrase('FGDs_with_influencers');?></option>
											
										 </select>
									</td>
									
									<td>
	                                     <select >
											
											<option value="score0"><?=get_phrase('no');?></option>
											<option value="score1"><?=get_phrase('yes');?> </option>
										 </select>
									</td>
									
									<td>
										<textarea class="form-control autogrow" name="progress_1" id="progress_1"  rows="2" placeholder="Comments"></textarea>
									</td>
								</tr>				
											
							</tbody>
						</table>
					
					</div>
					</div>
                        <div class='row'>

							<div class="col-xs-12">
								<div class="form-group">
									<label class="control-label" for="about"><?=get_phrase('general comment');?></label>
									<textarea class="form-control autogrow" name="about" id="about" data-validate="minlength[10]" rows="5" placeholder="<?=get_phrase('general comment');?>"></textarea>
								</div>
							</div>

						</div>

					</div>
					
					<div class='row'>

							<div class="col-xs-12">
								<div class="form-group">
									
									
									<button class="btn btn-primary" name="btnSubmit" id="btnSubmit" >Submit</button>
								</div>
							</div>
							

						</div>
						
					<ul class="pager wizard">
						<li class="previous first">
							<a href="#">First</a>
						</li>
						<li class="previous">
							<a href="#"><i class="entypo-left-open"></i> Previous</a>
						</li>

						<li class="next last">
							<a href="#">Last</a>
						</li>
						<li class="next">
							<a href="#">Next <i class="entypo-right-open"></i></a>
						</li>
					</ul>
				</div>

			</div>

		</div>
	</form>
</div>
</div>

<script>
    $(document).ready(function(){
    	
    	var table_id=$('#tbl_assessment_form');
    	
    	table_id.find($('select[multiple]')).not('.select2').addClass('select2');
	
	    table_id.find($('select')).not('[multiple]').addClass('form-control');
	
	    table_id.find(('tr th:first')).css('width','350px');
	     
	    table_id.find(('td')).css('width','150px');
    });
	
</script>

