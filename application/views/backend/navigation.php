<div class="sidebar-menu">
    <header class="logo-env" >

        <!-- logo -->
        <div class="logo" style="">
            <a href="<?php echo base_url(); ?>">
                <img src="<?php echo base_url();?>uploads/logo.png"  style="max-height:60px;"/>
            </a>
        </div>

        <!-- logo collapse icon -->
        <div class="sidebar-collapse" style="">
            <a href="#" class="sidebar-collapse-icon with-animation">

                <i class="entypo-menu"></i>
            </a>
        </div>

        <!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
        <div class="sidebar-mobile-menu visible-xs">
            <a href="#" class="with-animation">
                <i class="entypo-menu"></i>
            </a>
        </div>
    </header>

    <div style=""></div>
    <ul id="main-menu" class="">
        <!-- add class "multiple-expanded" to allow multiple submenus to open -->
        <!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->


        <!-- DASHBOARD -->
        <li class=" <?php echo get_access('dashboard');?> <?php if ($page_name == 'dashboard') echo 'active'; ?> ">
            <a href="<?php echo base_url();?>dashboard">
                <i class="entypo-gauge"></i>
                <span><?php echo get_phrase('dashboard'); ?></span>
            </a>
        </li>
        
        <!-- SETTINGS -->
        <li class="<?php
        if ($page_name == 'system_settings' ||
                $page_name == 'manage_language' ||
                    $page_name == 'sms_settings'||
					$page_name == 'assessment_settings' ||
					$page_name == 'user_profiles')
                        echo 'opened active';
        ?> <?=get_access('settings');?>">
            <a href="#">
                <i class="entypo-lifebuoy"></i>
                <span><?php echo get_phrase('settings'); ?></span>
            </a>
            <ul>
                <li class="<?php if ($page_name == 'system_settings') echo 'active'; ?> general_settings">
                    <a href="<?php echo base_url(); ?>index.php?settings/system_settings">
                        <span><i class="fa fa-cog"></i> <?php echo get_phrase('general_settings'); ?></span>
                    </a>
                </li>
                <li class="<?php if ($page_name == 'sms_settings') echo 'active'; ?> sms_settings">
                    <a href="<?php echo base_url(); ?>index.php?settings/sms_settings">
                        <span><i class="fa fa-mobile"></i> <?php echo get_phrase('sms_settings'); ?></span>
                    </a>
                </li>
                <li class="<?php if ($page_name == 'manage_language') echo 'active'; ?> language_settings">
                    <a href="<?php echo base_url(); ?>index.php?settings/manage_language">
                        <span><i class="fa fa-info"></i> <?php echo get_phrase('language_settings'); ?></span>
                    </a>
                </li>
                 <li class="<?php if ($page_name == 'assessment_settings') echo 'active'; ?> assessment_settings">
                    <a href="#">
                        <span><i class="fa fa-gears"></i> <?php echo get_phrase('assessment_settings'); ?></span>
                    </a>
                    <ul>
                    	<li class="<?php if ($page_name == 'assessment_settings') echo 'active'; ?>">
                    		<a href="<?=base_url();?>settings/assessment_settings/list_lead_bio">
                    			<span>
                    				<i class="fa fa-globe"></i>
                    					<?=get_phrase('lead_bio_fields');?>
                    			</span>	
                    		</a>
                    	</li>
                    	
                    	<li class="<?php if ($page_name == 'assessment_settings') echo 'active'; ?>">
                    		<a href="<?=base_url();?>settings/assessment_settings/view_assessment_milestones">
                    			<span>
                    				<i class="fa fa-list"></i>
                    					<?=get_phrase('assessment_milestones');?>
                    			</span>	
                    		</a>
                    	</li>
                    	
                    	<li class="<?php if ($page_name == 'assessment_settings') echo 'active'; ?>">
                    		<a href="<?=base_url();?>settings/assessment_settings/view_compassion_connect_progress_measures">
                    			<span>
                    				<i class="fa fa-line-chart"></i>
                    					<?=get_phrase('connect_progress_measures');?>
                    			</span>	
                    		</a>
                    	</li>
                    	
                    	<li class="<?php if ($page_name == 'assessment_settings') echo 'active'; ?>">
                    		<a href="<?=base_url();?>settings/assessment_settings/view_progress_measures">
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


         
    </ul>

</div>
