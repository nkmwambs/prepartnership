<div class="form-group">
	<label class="control-label" for="about"><?= get_phrase('general comment'); ?></label>
	<textarea <?=$disabled?> required='required' name='general_comment' class="form-control autogrow"  id="general_comment" data-validate="minlength[10]" rows="5" placeholder="<?= get_phrase('general comment'); ?>"><?=$lead_assessment_information['general_comment'];?></textarea>

</div>