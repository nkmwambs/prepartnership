<script>
	$(document).ready(function() {

		$("#btnSubmit").click(function(event){
			var assessment_id = $("#assessment_id").val();

			var url = '<?=base_url();?>leads/submit_assessment';
			var data = {'assessment_id':assessment_id};
			
			var count_of_empty_inputs = 0;
			$(".form-control").each(function(index,elem){
				if(($(elem).val() == '' || $(elem).val() == 0) && !$(elem).hasClass('select2')){
					count_of_empty_inputs++;
					$(elem).css('border','1px red solid');
				}
			});

			// $(".select2").each(function(index,elem){
			// 	if($(elem + 'option:selected').size() == 0){
			// 		count_of_empty_inputs++;
			// 		$(elem).css('border','1px red solid');
			// 	}
			// });

			if(count_of_empty_inputs > 0){
				alert('Some field are empty!');
			}else{
				posting_ajax(url,data,true);
				location.reload();
			}

			event.preventDefault();
		});
	});


	$(".assessment_verification_tool_id").change(function(){

		var assessment_id = $("#assessment_id").val();
		var progress_measure_id = $(this).data('progress_measure');
		var assessment_verification_tool_id = $(this).val();

		var url = '<?=base_url();?>leads/post_assessment_verification_tools';
		var data = {'ids':assessment_verification_tool_id,'assessment_id':assessment_id,'progress_measure_id':progress_measure_id};

		posting_ajax(url,data);
	});

	$(".assessment_method_id").change(function(){
		var assessment_id = $("#assessment_id").val();
		var progress_measure_id = $(this).data('progress_measure');
		var assessment_method_id = $(this).val();

		var url = '<?=base_url();?>leads/post_assessment_method';
		var data = {'ids':assessment_method_id,'assessment_id':assessment_id,'progress_measure_id':progress_measure_id};

		posting_ajax(url,data);
	});

	$(".score").change(function(){
		var assessment_id = $("#assessment_id").val();
		var progress_measure_id = $(this).data('progress_measure');
		var score = $(this).val();

		var url = '<?=base_url();?>leads/post_assessment_score';
		var data = {'score':score,'assessment_id':assessment_id,'progress_measure_id':progress_measure_id};

		
		$(document).ajaxSuccess(function(event,request,settings){
			$('#aggregate_score').html(request.responseText);
		});

		posting_ajax(url,data);
	});

	$(".comment").change(function(){
		var assessment_id = $("#assessment_id").val();
		var progress_measure_id = $(this).data('progress_measure');
		var comment = $(this).val();

		var url = '<?=base_url();?>leads/post_assessment_progress_measure_comment';
		var data = {'comment':comment,'assessment_id':assessment_id,'progress_measure_id':progress_measure_id};

		posting_ajax(url,data);
	});

	$("#general_comment").change(function(){
		var comment = $(this).val();
		var assessment_id = $("#assessment_id").val();

		var url = '<?=base_url();?>leads/post_assessment_general_comment';
		var data = {'comment':comment,'assessment_id':assessment_id};

		posting_ajax(url,data);
	});

	function posting_ajax(url,data,alert_message){
		$.ajax({
			url:url,
			data:data,
			type:"POST",
			beforeSend:function(){

			},
			success:function(response){
				if(alert_message){
					alert(response);
				}
			},
			error:function(){
				alert('Error Occurred');
			}
		});
	}
</script>