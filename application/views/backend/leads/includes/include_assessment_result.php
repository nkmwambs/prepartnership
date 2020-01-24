<table id="tbl_assessment_result" class='table table-striped'>
	<col width='25%'/>
	<col width='25%'/>
	<col width='25%'/>
	<col width='10%'/>
	<col width='15%'/>

	<thead>
		<tr>
			<th class='info_labels'><?= get_phrase("progress_measure"); ?></th>
			<th class='info_labels'><?= get_phrase("verication_tools"); ?></th>
			<th class='info_labels'><?= get_phrase("method_of_assessment"); ?></th>
			<th class='info_labels'><?= get_phrase("score"); ?></th>
			<th class='info_labels'><?= get_phrase("comment"); ?></th>
		</tr>
	</thead>

	<tbody>
		<?php 
			foreach($lead_assessment_information['assessment_result'] as $progress_measure_result){
				extract($progress_measure_result);
		?>
			<tr>
				<td>
					<?=$progress_measure['progress_measure_name']?>
					<input class='assessment_progress_measure_id' name='assessment_progress_measure_id[]' type='hidden' value='<?=$progress_measure['progress_measure_id']?>' />
				</td>
				
				<td>
					<select <?=$disabled?> data-progress_measure = '<?=$progress_measure['progress_measure_id']?>' name="assessment_verification_tool_id[<?=$progress_measure['progress_measure_id']?>][]" class='form-control select2 assessment_verification_tool_id' multiple='multiple' placeholder='Select verification tools used'>
						<?php foreach($verification_tools as $tool){?>
							<option value='<?=$tool['verification_tool_id'];?>' <?php if($tool['selected'] == 1) echo 'selected';?> ><?=$tool['verification_tool_name'];?></option>
						<?php }?>
					</select>
				</td>
				
				<td>
					<select <?=$disabled?> data-progress_measure = '<?=$progress_measure['progress_measure_id']?>' name="assessment_method_id[<?=$progress_measure['progress_measure_id']?>][]" class='form-control select2 assessment_method_id'  multiple='multiple' placeholder='Select methods of assessment used'>
						<?php foreach($methods_of_assessment as $method){?>
							<option value='<?=$method['assessment_method_id'];?>' <?php if($method['selected'] == 1) echo 'selected';?> ><?=$method['assessment_method_name'];?></option>
						<?php }?>
					</select>
				</td>
				<td>
					<select <?=$disabled?> data-progress_measure = '<?=$progress_measure['progress_measure_id']?>' name='score[<?=$progress_measure['progress_measure_id']?>][]'  class='form-control score'>
						<option value='0' <?php if($score == 0) echo 'selected';?> ><?=get_phrase('not_scored');?></option>
						<option value='1' <?php if($score == 1) echo 'selected';?>><?=get_phrase('high');?></option>
						<option value='-1' <?php if($score == -1) echo 'selected';?>><?=get_phrase('low');?></option>
					</select>
				</td>
				<td>
					<!-- <input type='text' class='form-control' data-validate="required"/> -->
					<textarea <?=$disabled?> data-progress_measure = '<?=$progress_measure['progress_measure_id']?>' name='comment[<?=$progress_measure['progress_measure_id']?>][]' class='form-control comment' placeholder='<?=get_phrase('enter_comment_here');?>'><?=$comment;?></textarea>
				</td>
			</tr>
		<?php 
			}
		?>
	</tbody>
</table>