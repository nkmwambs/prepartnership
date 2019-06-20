<?php //create an array that has the following keys: FCP, Risk and param
$test = $this -> finance_model -> prod_parameter_model();

$grid_array = $this -> finance_model -> build_dashboard_array('2019-03-31');

$none_requested_params = isset($grid_array['parameters']['no']) ? $grid_array['parameters']['no'] : array();

$requested_params = isset($grid_array['parameters']['yes']) ? $grid_array['parameters']['yes'] : array();

print_r($test);

// $fcp_risk_param_array = array();
//
// $fcp_risk_param_array = array("KE0200" => array("risk" => "High", "parameters" => array("Has the FCP submitted reports (MFR) by the due date per local guideline?", "Is the bank statement for the current period submitted with the report?", "Does the cash balance on report agree to the ending balance on bank statement?")), "KE0215" => array("risk" => "Medium", "parameters" => array("Has the FCP submitted reports (MFR) by the due date per local guideline?", "Is the bank statement for the current period submitted with the report?", "Does the cash balance on report agree to the ending balance on bank statement?")), "KE0415" => array("risk" => "Low", "parameters" => array("Has the FCP submitted reports (MFR) by the due date per local guideline?", "Is the bank statement for the current period submitted with the report?", "Does the cash balance on report agree to the ending balance on bank statement?")), );
//
// $risk_params_array = array();
//
// foreach ($fcp_risk_param_array as $fcpkey => $risk_param_value)
// {
// foreach ($risk_param_value as $key => $value_params)
// {
// if (is_array($value_params))
// {
// foreach ($value_params as $key_ => $value_param)
// {
// $risk_params_array[$fcpkey][] = $value_param;
//
// }
//
// } else
// {
// $risk_params_array[$fcpkey][] = $value_params;
// }
// }
// }
//
// print_r(json_encode($risk_params_array).'<br>');
//
// print ("______________________________________<br>");
// print_r(json_encode($fcp_risk_param_array));
?>
<?php 
 if(empty($none_requested_params) && empty($requested_params)){
 	?>
 	<div class='row'>
 		<div class='col-xs-12'>
 			<div class='well' style="text-align: center;">No Parameters and kindly contact system admin to populate  parameters </div>
 		</div>
 		
 	</div>
 	<?php
 	//break;
 }else{
 	

?>
<div class='row'>
	<div class='col-xs-12'>
		<form class='form-horizontal form-groups-bordered validate'>
			<div class="form-group">
				<label class="control-label col-xs-3">Period</label>
				<div class="col-xs-9">
					<select class="form-control">
						<option>Select period</option>
						<option>Monthly</option>
						<option>Quaterly</option>
						<option>Semi-annually</option>
						<option>Anually</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-3">Parameter</label>
				<div class='col-xs-9' id='parameter_div'>
					<div class='row row_to_clone' style="margin-bottom: 10px;">
						<div class="col-xs-3">
							<select class="form-control">
								<option>Select parameter</option>
								<option>Budget Variance</option>
								<option>Count of petty cash transactions</option>
								<option>Percent petty cash transaction</option>
								<option>Bank statement available</option>
							</select>
						</div>

						<div class="col-xs-3">
							<select class="form-control">
								<option>Select Operator</option>
								<option>Equal To</option>
								<option>Greater Than</option>
								<option>Less Than</option>
								<option>Equal or greater than</option>
								<option>Equal or less than</option>
							</select>
						</div>

						<div class="col-xs-3">
							<input type="text" class="form-control" />
						</div>

						<div class="col-xs-3">
							<button class="btn btn-primary add_parameter">
								Add Parameter
							</button>
						</div>

					</div>

				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-xs-3">FCP</label>
				<div class="col-xs-9">
					<select class="form-control select2" multiple="multiple">
						<option>Select FCP</option>
						<option>KE0200</option>
						<option>KE0415</option>
						<option>KE0719</option>
						<option>KE0910</option>
					</select>
				</div>
			</div>

			<div class="form-group">

				<div class="col-xs-offset-6 col-xs-6">
					<button class="btn btn-primary">
						Filter
					</button>
				</div>
			</div>
		</form>

	</div>
</div>
<hr/>
<div class='row'>
	<div class='col-xs-12'>
		
		<table  class='table table-bordered '>
			<thead>
				
				<tr>
					<th rowspan="2">FCP ID</th>
					<th rowspan="2">Risk</th>
					<?php if(!empty($none_requested_params)){?>
					<th colspan="<?= count($none_requested_params); ?>">Non Requested Parameters</th>
					<?php } ?>
					<?php if(!empty($requested_params)){?>
					<th colspan="<?= count($requested_params); ?>">Requested Parameters</th>
					<?php } ?>
				</tr>
				<tr>
				
				<?php 
				
				if(!empty($none_requested_params)){
				 foreach ($none_requested_params as $none_requested_param) {
				 ?>
				     
				     <th><?= $none_requested_param; ?></th>
				 <?php }
						}
				?>
				<!--Requested Parameters-->
				
				<?php 
				if(!empty($requested_params)){
				 foreach ($requested_params as $requested_param) {
				 ?>
				     
				     <th><?= $requested_param; ?></th>
				     
				 <?php }
						}
				?>
				
				</tr>
			</thead>
			
			<tbody>
				<?php 
				 foreach ($grid_array['fcps_with_risks'] as $fcp_id => $value) { 
				?>
				   <tr>
				   	 <td><?= $fcp_id; ?></td>
				   	 <td><?= $value['risk']; ?></td>
				   	 <?php
				   	 if(isset($value['params'])){
				   	  foreach ($value['params'] as $param) { 
				   	 ?>
				   	   <td><?= $param; ?></td>
				   	  <?php 
					  } 
					 }
				   	  ?>
				   </tr>
				<?php } ?>
			</tbody>
			
		</table>

		

	</div>

</div>
<?php } ?>

<script type="text/javascript">
	jQuery(document).ready(function($) {

		var datatable = $(".datatable").dataTable({
			dom : 'lBfrtip',
			buttons : ['pdf', 'csv', 'excel', 'copy']

		});

		$(".dataTables_wrapper select").select2({
			minimumResultsForSearch : -1
		});
	});
	//Clone row
	$('.add_parameter').on('click', function(ev) {

		var row_to_clone = $(this).closest('.row_to_clone');

		var cloned_row = row_to_clone.clone();

		row_to_clone.after(cloned_row);

		//
		//row_to_clone.find('button').html('Remove Parameter');

		//row_to_clone.find('button').toggleClass('btn-primary btn-danger');

		// row_to_clone.find('button').toggleClass('add_parameter remove_parameter');

		// cloned_row.find('button').addClass('add_parameter');

		//alert(cloned_row.find('button').parent().html());

		ev.preventDefault();

		//alert(row_to_clone.html());
	});
</script>