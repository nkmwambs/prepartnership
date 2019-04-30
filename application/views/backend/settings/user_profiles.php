<div class="row">
	<div class="col-sm-12">
	
		<div class="btn btn-primary" onclick="showAjaxModal('<?=base_url();?>Modal/popup/modal_profile_add/2');">Add Profile</div>
		
		<hr/>
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Profile Name</th>
					<th>Description</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<?php
					$profiles = $this->db->get('profile');
					if($profiles->num_rows() > 0){
						foreach($profiles->result_object() as $rows){
				?>
					<tr>
						<td><?=$rows->name;?></td>
						<td><?=$rows->description;?></td>
						<td>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
									Action <span class="caret"></span>
								</button>
								
								<ul class="dropdown-menu dropdown-default pull-right" role="menu">
									<li class="<?=get_access('set_up_entitlement','settings');?>">
										<a href="<?php echo base_url();?>settings/entitlement/<?=$rows->profile_id;?>">
											<i class="fa fa-link"></i>
											Entitlement
										</a>
									</li>
									
									<li class="divider <?=get_access('set_up_entitlement','settings');?>"></li>
									
									<li class="<?=get_access('edit_profile','settings');?>">
										<a href="<?php echo base_url();?>settings/entitlement/<?=$rows->profile_id;?>">
											<i class="fa fa-pencil"></i>
											Edit
										</a>
									</li>
									
									<li class="divider <?=get_access('edit_profile','settings');?>"></li>
									
									<li class="<?=get_access('delete_profile','settings');?>">
										<a href="<?php echo base_url();?>settings/entitlement/<?=$rows->profile_id;?>">
											<i class="fa fa-eraser"></i>
											Delete
										</a>
									</li>
								</ul>
							</div>
						</td>
					</tr>
				<?php
						}
					}
				?>
			</tbody>
		</table>
	</div>
</div>

<script>
	$(document).ready(function(){
		var datatable=  $(".table").DataTable();
	});
</script>