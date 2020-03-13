<header class="navbar navbar-fixed-top"><!-- set fixed position by adding class "navbar-fixed-top" -->
		
		<div class="navbar-inner">
		
			<!-- logo -->
			<div class="navbar-brand">
				<a href="<?=base_url();?>">
					<img src="<?=base_url();?>uploads/logo.png" width="60" alt="" />
				</a>
			</div>
			
			
			<!-- main menu -->
						
	<ul class="navbar-nav">
   
        <!-- add class "multiple-expanded" to allow multiple submenus to open -->
        <!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->


        <!-- DASHBOARD -->
        <li class=" <?php echo get_access('dashboard');?> ">
            <a href="<?php echo base_url();?>dashboard">
                <i class="entypo-gauge"></i>
                <span><?php echo get_phrase('dashboard'); ?></span>
            </a>
        </li>
        
        <!-- LEADS MENU -->
        <li class=" <?php echo get_access('leads');?> ">
            <a href="#">
                <i class="entypo-compass"></i>
                <span><?php echo get_phrase('leads'); ?></span>
            </a>
            <ul>
            	<li class="<?=get_access('active_leads','leads');?>">
            		<a href="<?php echo base_url();?>leads/active_leads_information">
            			<i class='entypo-sound'></i>
            			<span> <?=get_phrase('active_leads');?></span>
            		</a>
            	</li>
            	
            	<li class="<?=get_access('closed_leads','leads');?>">
            		<a href="<?php echo base_url();?>leads/closed_leads_information">
            			<i class='entypo-mute'></i>
            			<span> <?=get_phrase('closed_leads');?></span>
            		</a>
            	</li>

                <li class="<?=get_access('mature_leads','leads');?>">
            		<a href="<?php echo base_url();?>leads/mature_leads_information">
            			<i class='entypo-graduation-cap'></i>
            			<span> <?=get_phrase('mature_leads');?></span>
            		</a>
            	</li>

            </ul>
        </li>
        <!-- SETTINGS -->
        <li class="<?php echo get_access('settings');?> ">
            <a href="#">
                <i class="entypo-cog"></i>
                <span><?php echo get_phrase('settings'); ?></span>
            </a>
            <ul>
                <li class="<?php echo get_access('general_settings','settings');?> <?php if ($page_name == 'system_settings') echo 'active'; ?> general_settings">
                    <a href="<?php echo base_url(); ?>settings/system_settings">
                        <span><i class="fa fa-cog"></i> <?php echo get_phrase('general_settings'); ?></span>
                    </a>
                </li>
                
                <li class="<?php echo get_access('language_settings','settings');?> <?php if ($page_name == 'manage_language') echo 'active'; ?> language_settings">
                    <a href="<?php echo base_url(); ?>settings/manage_language">
                        <span><i class="fa fa-info"></i> <?php echo get_phrase('language_settings'); ?></span>
                    </a>
                </li>
                 <li class="<?php echo get_access('assessment_settings','settings');?> <?php if ($page_name == 'assessment_settings') echo 'active'; ?> assessment_settings">
                    <a href="#">
                        <span><i class="fa fa-gears"></i> <?php echo get_phrase('assessment_settings'); ?></span>
                    </a>
                    <ul>
                    	<li class="<?php echo get_access('lead_bio_settings','settings');?> <?php if ($page_name == 'assessment_settings') echo 'active'; ?>">
                    		<a href="<?=base_url();?>settings/leads_bio_field">
                    			<span>
                    				<i class="fa fa-globe"></i>
                    					<?=get_phrase('leads_bio_fields');?>
                    			</span>	
                    		</a>
                    	</li>
                    	
                    	<li class="<?php echo get_access('assessment_milestones','settings');?> <?php if ($page_name == 'assessment_settings') echo 'active'; ?>">
                    		<a href="<?=base_url();?>settings/assessment_milestones">
                    			<span>
                    				<i class="fa fa-list"></i>
                    					<?=get_phrase('assessment_milestones');?>
                    			</span>	
                    		</a>
                    	</li>
                    	
                    	<li class="<?php echo get_access('connect_progress_measures','settings');?> <?php if ($page_name == 'assessment_settings') echo 'active'; ?>">
                    		<a href="<?=base_url();?>settings/compassion_stage">
                    			<span>
                    				<i class="fa fa-line-chart"></i>
                    					<?=get_phrase('connect_stage');?>
                    			</span>	
                    		</a>
                    	</li>
                    	
                    	<li class="<?php echo get_access('assessment_progress_measures','settings');?> <?php if ($page_name == 'assessment_settings') echo 'active'; ?>">
                    		<a href="<?=base_url();?>settings/assessment_progress_measures">
                    			<span>
                    				<i class="fa fa-bar-chart"></i>
                    					<?=get_phrase('assessment_progress_measures');?>
                    			</span>	
                    		</a>
                    	</li>
                    </ul>
                </li>
                <li class="<?php if ($page_name == 'user_profiles') echo 'active'; ?> <?=get_access('user_profiles','settings');?>">
                    <a href="<?php echo base_url(); ?>settings/user_profiles">
                        <span><i class="fa fa-flag"></i> <?php echo get_phrase('user_profiles'); ?></span>
                    </a>
                </li>
            </ul>
        </li>
        <!-- Accounts -->
        <li class="<?php echo get_access('account');?>">
            <a href="#">
                <i class="entypo-lifebuoy"></i>
                <span><?php echo get_phrase('account'); ?></span>
            </a>
            <ul>
                <li class="<?php echo get_access('change_password','account');?>">
                    <a href="#">
                        <i class="entypo-lock"></i> <?=get_phrase('change_password');?>
                    </a>

				
				<ul class="<?php echo get_access('edit_profile','account');?>">
					<li>
						<a href="<?php echo base_url();?>account/manage_profile">
                        	<i class="entypo-info"></i>
							<span><?php echo get_phrase('edit_profile');?></span>
						</a>
					</li>

				</ul>
				
				
			</li>
				<!-- Language Selector--> 			
           <li class="<?php echo get_access('language','account');?>">
                    <a href="#">
                        <i class="entypo-globe"></i> <?php echo get_phrase('language');?>
                    </a>
				
				<ul class="">
					<?php
                            $fields = $this->db->list_fields('language');
                            foreach ($fields as $field)
                            {
                                if(($field == 'phrase_id' || $field == 'phrase') || $field=='tooltip')continue;
                                ?>
                                    <li class="<?php if($this->session->userdata('current_language') == $field)echo 'active';?>">
                                        <a href="<?php echo base_url();?>multilanguage/select_language/<?php echo $field;?>">
                                            <img src="<?php echo base_url();?>assets/images/flag/<?php echo $field;?>.png" style="width:16px; height:16px;" />	
												 <span><?php echo ucfirst($field);?></span>
                                        </a>
                                    </li>
                                <?php
                            }
                            ?>
                    
				</ul>
				
			</li>
            </ul>
          </li> 
    </ul>
    <ul class="nav navbar-right pull-right">
       <li class="has-sub">
                    <a href="#" >
                        	<i class="entypo-user"></i> <?php echo ucfirst($this->session->name).' - '.ucfirst($this->session->role_name);?> (<?php echo $this->session->profile_name;?>) 
                    </a>

			</li>
				
				<li class="sep"></li>
				
				<li>
					<a href="<?php echo base_url();?>login/logout">
					  <?=get_phrase('log_out');?> <i class="entypo-logout right"></i>
				    </a>
				</li>
				
				
				<!-- mobile only -->
				<li class="visible-xs">	
				
					<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
					<div class="horizontal-mobile-menu visible-xs">
						<a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
							<i class="entypo-menu"></i>
						</a>
					</div>
					
				</li>
				</ul>
    </div>
    </header>