<script>
	$(document).ready(function() {

		var table_id = $('#tbl_assessment_form');

		table_id.find($('select[multiple]')).not('.select2').addClass('select2');

		table_id.find($('select')).not('[multiple]').addClass('form-control');

		table_id.find(('tr th:first')).css('width', '350px');

		table_id.find(('td')).css('width', '150px');
	});
</script>