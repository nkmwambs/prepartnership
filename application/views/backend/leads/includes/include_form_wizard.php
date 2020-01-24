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
						}else{
							//echo "disabled";
						}
					
					?>">
					<a href="#tab-<?=$assessment_milestone['assessment_milestone_id'];?>" data-toggle="tab"><span><?=$assessment_milestone['assessment_milestone_initial'];?></span><a href="<?=base_url();?>leads/lead_assessment/<?=$this->uri->segment(3);?>/<?=$assessment_milestone['assessment_milestone_id'];?>"><?=$assessment_milestone['assessment_milestone_name'];?></a></a>
				</li>
			<?php }?>
		</ul>