<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');?>
<div class="row">
	<div class="col-xs-12">	
		<?=$output;?>
	</div>
</div>
<script>
	$('#frm_bio .is_field_null').on('change',function(){
		
		if($(this).val()=='no')
		{
			//Go to parent the is_field_null and move to the next td and get the iput field
			$(this).parent().next().find('input').addClass('required').prop('placeholder','Place here a value');
		}
	});
	
</script>