-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `access`;
CREATE TABLE `access` (
  `access_id` int(100) NOT NULL AUTO_INCREMENT,
  `entitlement_id` int(100) NOT NULL,
  `profile_id` int(10) NOT NULL,
  PRIMARY KEY (`access_id`),
  KEY `privilege_id` (`entitlement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `access` (`access_id`, `entitlement_id`, `profile_id`) VALUES
(5,	6,	1),
(6,	7,	1),
(7,	8,	1),
(8,	9,	1),
(9,	3,	1),
(10,	10,	1),
(11,	11,	1),
(12,	12,	1),
(13,	13,	1),
(14,	14,	1),
(15,	15,	1),
(16,	16,	1),
(17,	17,	1),
(18,	18,	1),
(19,	19,	1),
(20,	20,	1),
(21,	21,	1),
(22,	22,	1),
(23,	23,	1);

DROP TABLE IF EXISTS `assessment`;
CREATE TABLE `assessment` (
  `assessment_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_milestones_id` int(3) NOT NULL,
  PRIMARY KEY (`assessment_id`),
  KEY `assessment_milestones_id` (`assessment_milestones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `assessment_milestones`;
CREATE TABLE `assessment_milestones` (
  `assessment_milestones_id` int(3) NOT NULL AUTO_INCREMENT,
  `milestone_name` varchar(20) NOT NULL,
  `milestones_insert_after_id` int(100) NOT NULL,
  `assessment_period_in_days` int(5) NOT NULL,
  `assessment_review_status` varchar(50) NOT NULL,
  `user_customized_review_status` varchar(50) NOT NULL,
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  PRIMARY KEY (`assessment_milestones_id`),
  KEY `milestones_insert_after_id` (`milestones_insert_after_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `assessment_progress_measure`;
CREATE TABLE `assessment_progress_measure` (
  `assessment_progress_measure_id` int(3) NOT NULL AUTO_INCREMENT,
  `Progress_measure_title` varchar(100) NOT NULL,
  `verification_tool` longtext NOT NULL,
  `weight` int(3) NOT NULL,
  `assessment_method` longtext NOT NULL,
  `compassion_connect_mapping` varchar(50) NOT NULL,
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '0=suspended,1=active',
  PRIMARY KEY (`assessment_progress_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `compassion_connect_mapping`;
CREATE TABLE `compassion_connect_mapping` (
  `compassion_connect_mapping_id` int(3) NOT NULL AUTO_INCREMENT,
  `lead_score_parameter` varchar(50) NOT NULL,
  `lead_score_stage` int(5) NOT NULL,
  PRIMARY KEY (`compassion_connect_mapping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `connect_stage`;
CREATE TABLE `connect_stage` (
  `connect_stage_id` int(10) NOT NULL AUTO_INCREMENT,
  `connect_stage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`connect_stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `connect_stage` (`connect_stage_id`, `connect_stage_name`) VALUES
(1,	'Stage 1'),
(2,	'Stage 2');

DROP TABLE IF EXISTS `datatype`;
CREATE TABLE `datatype` (
  `datatype_id` int(100) NOT NULL AUTO_INCREMENT,
  `datatype_name` varchar(20) NOT NULL,
  `sql_type` varchar(20) NOT NULL,
  PRIMARY KEY (`datatype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `datatype` (`datatype_id`, `datatype_name`, `sql_type`) VALUES
(1,	'text',	'VARCHAR'),
(2,	'number',	'INT');

DROP TABLE IF EXISTS `entitlement`;
CREATE TABLE `entitlement` (
  `entitlement_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `derivative_id` int(10) NOT NULL,
  `visibility` int(5) NOT NULL,
  PRIMARY KEY (`entitlement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `entitlement` (`entitlement_id`, `name`, `derivative_id`, `visibility`) VALUES
(2,	'dashboard',	0,	1),
(3,	'test_button',	2,	1),
(5,	'settings',	0,	1),
(6,	'user_profiles',	5,	1),
(7,	'set_up_entitlement',	5,	1),
(8,	'edit_profile',	5,	1),
(9,	'delete_profile',	5,	1),
(10,	'general_settings',	5,	1),
(11,	'language_settings',	5,	1),
(12,	'assessment_settings',	5,	1),
(13,	'lead_bio_settings',	5,	1),
(14,	'assessment_milestones',	5,	1),
(15,	'connect_progress_measures',	5,	1),
(16,	'assessment_progress_measures',	5,	1),
(17,	'account',	0,	1),
(18,	'leads',	0,	1),
(19,	'active_leads',	18,	1),
(20,	'closed_leads',	18,	1),
(21,	'change_password',	17,	1),
(22,	'edit_profile',	17,	1),
(23,	'language',	17,	1);

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooltip` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `spanish` longtext COLLATE utf8_unicode_ci NOT NULL,
  `french` longtext COLLATE utf8_unicode_ci NOT NULL,
  `swahili` longtext COLLATE utf8_unicode_ci,
  `Hindu` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`phrase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `leads_bio_information`;
CREATE TABLE `leads_bio_information` (
  `leads_bio_information_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_milestones_id` int(3) NOT NULL DEFAULT '1' COMMENT '1=initial assessment',
  `lead_status` varchar(8) NOT NULL DEFAULT 'Active' COMMENT 'Active=lead is live; Closed=Lead converted or closed',
  PRIMARY KEY (`leads_bio_information_id`),
  UNIQUE KEY `lead_connect_id` (`lead_connect_id`),
  KEY `assessment_milestones_id` (`assessment_milestones_id`),
  CONSTRAINT `leads_bio_information_ibfk_1` FOREIGN KEY (`assessment_milestones_id`) REFERENCES `assessment_milestones` (`assessment_milestones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `lead_bio_fields`;
CREATE TABLE `lead_bio_fields` (
  `lead_bio_fields_id` int(100) NOT NULL AUTO_INCREMENT,
  `lead_bio_fields_name` varchar(100) NOT NULL,
  `lead_bio_info_column` varchar(50) NOT NULL,
  `datatype_id` int(100) NOT NULL,
  `is_field_unique` int(5) NOT NULL DEFAULT '1',
  `is_field_null` int(5) NOT NULL DEFAULT '0',
  `default_value` varchar(20) NOT NULL,
  `show_field` int(5) NOT NULL DEFAULT '1',
  `is_suspended` int(5) NOT NULL DEFAULT '0' COMMENT '0 means NO and 1 means YES',
  PRIMARY KEY (`lead_bio_fields_id`),
  KEY `datatype_id` (`datatype_id`),
  CONSTRAINT `lead_bio_fields_ibfk_1` FOREIGN KEY (`datatype_id`) REFERENCES `datatype` (`datatype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `profile_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `assignable` tinyint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `profile` (`profile_id`, `name`, `description`, `assignable`) VALUES
(1,	'Assessor',	'',	1),
(2,	'Manager ',	'Manager',	0);

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `created_by` int(5) NOT NULL,
  `last_modified_by` int(5) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `role` (`role_id`, `role_name`, `created_by`, `last_modified_by`, `created_date`, `last_modified_date`) VALUES
(1,	'PF',	1,	1,	'2019-04-30 07:42:26',	'2019-04-30 04:42:26');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1,	'system_name',	'Prepartnership Assessment Tool'),
(2,	'system_title',	'Prepartnership Assessment'),
(3,	'address',	'1945 Nairobi'),
(4,	'phone',	'254711808071'),
(7,	'system_email',	'support@compassionkenya.com'),
(8,	'active_sms_service',	'disabled'),
(9,	'language',	'english'),
(10,	'text_align',	'left-to-right'),
(11,	'clickatell_user',	''),
(12,	'clickatell_password',	''),
(13,	'clickatell_api_id',	''),
(14,	'skin_colour',	'blue'),
(15,	'twilio_account_sid',	''),
(16,	'twilio_auth_token',	''),
(17,	'twilio_sender_phone_number',	''),
(18,	'sidebar-collapsed',	'no');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(100) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email_notify` tinyint(5) NOT NULL DEFAULT '1',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` tinyint(10) NOT NULL,
  `profile_id` tinyint(5) NOT NULL,
  `auth` tinyint(5) NOT NULL,
  `system_admin` tinyint(5) NOT NULL DEFAULT '0',
  `create_by` int(5) NOT NULL,
  `last_modified_by` int(5) NOT NULL,
  `created_date` date NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `email`, `email_notify`, `password`, `gender`, `phone`, `role_id`, `profile_id`, `auth`, `system_admin`, `create_by`, `last_modified_by`, `created_date`, `last_modified_date`) VALUES
(1,	'Livingstone',	'Onduso',	'londuso@ke.ci.org',	1,	'fbdf9989ea636d6b339fd6b85f63e06e',	'Male',	'0723305687',	1,	1,	1,	0,	1,	1,	'2019-04-30',	'2019-04-30 08:03:17');

DROP TABLE IF EXISTS `yes_no_option`;
CREATE TABLE `yes_no_option` (
  `yes_no_option_id` int(5) NOT NULL AUTO_INCREMENT,
  `yes_no_option_key` int(5) NOT NULL,
  `yes_no_option_name` varchar(10) NOT NULL,
  PRIMARY KEY (`yes_no_option_id`),
  UNIQUE KEY `yes_no_option_key` (`yes_no_option_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `yes_no_option` (`yes_no_option_id`, `yes_no_option_key`, `yes_no_option_name`) VALUES
(1,	0,	'No'),
(2,	1,	'Yes');

-- 2019-07-10 10:15:36
