<div class="steps-progress">
			<div class="progress-indicator"></div>
		</div>

		<ul>
		
	

			<?php foreach($assessment_milestones as $assessment_milestone){?>
				<li class="<?php
				       
						

							if($assessment_milestone_id  == $assessment_milestone['assessment_milestone_id']){
								echo "active";
							}elseif($assessment_milestone_id > $assessment_milestone['assessment_milestone_id']){
								echo "completed";
							}

						
						
					
					?>">
					<a href="#tab-<?=$assessment_milestone['assessment_milestone_id'];?>" data-toggle="tab"><span><?=$assessment_milestone['assessment_milestone_initial'];?></span><a href="<?=base_url();?>leads/lead_assessment/<?=$this->uri->segment(3);?>/<?=$assessment_milestone['assessment_milestone_id'];?>"><?=$assessment_milestone['assessment_milestone_name'];?></a></a>
				</li>
			<?php }?>
		</ul>
<!-- To be completed and moved after submit but and write javascript to modify the class of active -->
		<?php 
		//  $this->db->select(array('assessment.leads_bio_information_id','assessment.assessment_milestones_id','assessment.is_completed','assessment_milestones.is_final_milestone'));
		//  $this->db->join('assessment_milestones','assessment_milestones.assessment_milestones_id=assessment.assessment_milestones_id');
		//  $test=$this->db->get_where('assessment', array('leads_bio_information_id'=>$lead_id[0],'assessment_milestones.is_final_milestone'=>1,'assessment.assessment_milestones_id'=>$milestone[0]))->result_array();
		 
		//  if(sizeof($test)>0){
		// 	echo "completed";
		// }
		 //print_r($test);
		?>

		