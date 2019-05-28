-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

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

CREATE TABLE `assessment_milestones` (
  `assessment_milestones_id` int(3) NOT NULL AUTO_INCREMENT,
  `milestone_name` varchar(20) NOT NULL,
  `insert_after` int(5) NOT NULL,
  `assessment_period_in_days` int(5) NOT NULL,
  `assessment_review_status` varchar(50) NOT NULL,
  `user_customized_review_status` varchar(50) NOT NULL,
  PRIMARY KEY (`assessment_milestones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `assessment_progress_measure` (
  `assessment_progress_measure_id` int(3) NOT NULL AUTO_INCREMENT,
  `Progress_measure_title` varchar(100) NOT NULL,
  `verification_tool` longtext NOT NULL,
  `weight` int(3) NOT NULL,
  `assessment_method` longtext NOT NULL,
  `compassion_connect_mapping` varchar(50) NOT NULL,
  PRIMARY KEY (`assessment_progress_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `compassion_connect_mapping` (
  `compassion_connect_mapping_id` int(3) NOT NULL AUTO_INCREMENT,
  `lead_score_parameter` varchar(50) NOT NULL,
  `lead_score_stage` int(5) NOT NULL,
  PRIMARY KEY (`compassion_connect_mapping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `connect_stage` (
  `connect_stage_id` int(10) NOT NULL AUTO_INCREMENT,
  `connect_stage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`connect_stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `connect_stage` (`connect_stage_id`, `connect_stage_name`) VALUES
(1,	'Stage 1'),
(2,	'Stage 2');

CREATE TABLE `datatype` (
  `datatype_id` int(100) NOT NULL AUTO_INCREMENT,
  `datatype_name` varchar(20) NOT NULL,
  PRIMARY KEY (`datatype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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

INSERT INTO `language` (`phrase_id`, `phrase`, `tooltip`, `english`, `spanish`, `french`, `swahili`, `Hindu`) VALUES
(81,	'Field Name',	'A tooltip example',	'',	'',	'',	NULL,	NULL),
(82,	'Data Type',	'',	'',	'',	'',	NULL,	NULL),
(83,	'Is Field Unique?',	'',	'',	'',	'',	NULL,	NULL),
(84,	'Is Field Null?',	'',	'',	'',	'',	NULL,	NULL),
(85,	'default_value',	'',	'',	'',	'',	NULL,	NULL),
(86,	'assessment_settings',	'',	'',	'',	'',	NULL,	NULL),
(87,	'dashboard',	'',	'',	'',	'',	NULL,	NULL),
(88,	'settings',	'',	'',	'',	'',	NULL,	NULL),
(89,	'general_settings',	'',	'',	'',	'',	NULL,	NULL),
(90,	'sms_settings',	'',	'',	'',	'',	NULL,	NULL),
(91,	'language_settings',	'',	'',	'',	'',	NULL,	NULL),
(92,	'lead_bio_fields',	'',	'',	'',	'',	NULL,	NULL),
(93,	'assessment_milestones',	'',	'',	'',	'',	NULL,	NULL),
(94,	'connect_progress_measures',	'',	'',	'',	'',	NULL,	NULL),
(95,	'assessment_progress_measures',	'',	'',	'',	'',	NULL,	NULL),
(96,	'user_profiles',	'',	'',	'',	'',	NULL,	NULL),
(97,	'edit_profile',	'',	'',	'',	'',	NULL,	NULL),
(98,	'change_password',	'',	'',	'',	'',	NULL,	NULL),
(99,	'language',	'',	'',	'',	'',	NULL,	NULL),
(100,	'back',	'',	'',	'',	'',	NULL,	NULL),
(101,	'go_back',	'',	'',	'',	'',	NULL,	NULL),
(102,	'Are_you_sure_you_want_to_perform_this_action?',	'',	'',	'',	'',	NULL,	NULL),
(103,	'process_aborted',	'',	'',	'',	'',	NULL,	NULL),
(104,	'please_wait_until_you_receive_confirmation',	'',	'',	'',	'',	NULL,	NULL),
(105,	'delete',	'',	'',	'',	'',	NULL,	NULL),
(106,	'cancel',	'',	'',	'',	'',	NULL,	NULL),
(107,	'Ok',	'',	'',	'',	'',	NULL,	NULL),
(108,	'Assessment Milestone Name:',	'',	'',	'',	'',	NULL,	NULL),
(109,	'Insert Milestone After',	'',	'',	'',	'',	NULL,	NULL),
(110,	'Period Needed to Complete(in months)',	'',	'',	'',	'',	NULL,	NULL),
(111,	'Assessment Review Status',	'',	'',	'',	'',	NULL,	NULL),
(112,	'User Customized Review Status',	'',	'',	'',	'',	NULL,	NULL),
(113,	'Field Unique?',	'',	'',	'',	'',	NULL,	NULL),
(114,	'Optional?',	'',	'',	'',	'',	NULL,	NULL),
(115,	'Default Value',	'',	'',	'',	'',	NULL,	NULL),
(116,	'Milestone Name',	'The name of the assessment milestone',	'',	'',	'',	NULL,	NULL),
(117,	'When',	'',	'',	'',	'',	NULL,	NULL),
(118,	'Review Status',	'',	'',	'',	'',	NULL,	NULL),
(119,	'login',	'',	'',	'',	'',	NULL,	NULL),
(120,	'forgot_your_password',	'',	'',	'',	'',	NULL,	NULL),
(121,	'initial_assessment',	'',	'',	'',	'',	NULL,	NULL),
(122,	'Lead Score Criteria Parameter',	'',	'',	'',	'',	NULL,	NULL),
(123,	'Lead Score Stage',	'',	'',	'',	'',	NULL,	NULL),
(124,	'Connect Lead Score Stage',	'',	'',	'',	'',	NULL,	NULL),
(125,	'Progress Measure',	'',	'',	'',	'',	NULL,	NULL),
(126,	'Tools Of Verification',	'',	'',	'',	'',	NULL,	NULL),
(127,	'Progress Measure Weight',	'',	'',	'',	'',	NULL,	NULL),
(128,	'CC Mapping',	'',	'',	'',	'',	NULL,	NULL),
(129,	'Progress Measure Title',	'',	'',	'',	'',	NULL,	NULL),
(130,	'Verification Tools',	'',	'',	'',	'',	NULL,	NULL),
(131,	'Method of assessment',	'',	'',	'',	'',	NULL,	NULL),
(132,	'Weight',	'',	'',	'',	'',	NULL,	NULL),
(133,	'Connect Mapping',	'',	'',	'',	'',	NULL,	NULL),
(134,	'account',	'',	'',	'',	'',	NULL,	NULL),
(135,	'entitlement',	'',	'',	'',	'',	NULL,	NULL),
(136,	'log_out',	'',	'',	'',	'',	NULL,	NULL),
(137,	'forward',	'',	'',	'',	'',	NULL,	NULL),
(138,	'system_settings',	'',	'',	'',	'',	NULL,	NULL),
(139,	'system_name',	'',	'',	'',	'',	NULL,	NULL),
(140,	'system_title',	'',	'',	'',	'',	NULL,	NULL),
(141,	'address',	'',	'',	'',	'',	NULL,	NULL),
(142,	'phone',	'',	'',	'',	'',	NULL,	NULL),
(143,	'system_email',	'',	'',	'',	'',	NULL,	NULL),
(144,	'text_align',	'',	'',	'',	'',	NULL,	NULL),
(145,	'sidebar_collapsed',	'',	'',	'',	'',	NULL,	NULL),
(146,	'yes',	'',	'',	'',	'',	NULL,	NULL),
(147,	'no',	'',	'',	'',	'',	NULL,	NULL),
(148,	'save',	'',	'',	'',	'',	NULL,	NULL),
(149,	'update_product',	'',	'',	'',	'',	NULL,	NULL),
(150,	'file',	'',	'',	'',	'',	NULL,	NULL),
(151,	'install_update',	'',	'',	'',	'',	NULL,	NULL),
(152,	'theme_settings',	'',	'',	'',	'',	NULL,	NULL),
(153,	'default',	'',	'',	'',	'',	NULL,	NULL),
(154,	'select_theme',	'',	'',	'',	'',	NULL,	NULL),
(155,	'select_a_theme_to_make_changes',	'',	'',	'',	'',	NULL,	NULL),
(156,	'upload_logo',	'',	'',	'',	'',	NULL,	NULL),
(157,	'photo',	'',	'',	'',	'',	NULL,	NULL),
(158,	'upload',	'',	'',	'',	'',	NULL,	NULL),
(159,	'leads',	'',	'',	'',	'',	NULL,	NULL),
(160,	'active_leads',	'',	'',	'',	'',	NULL,	NULL),
(161,	'closed_leads',	'',	'',	'',	'',	NULL,	NULL),
(162,	'Insert After',	'',	'',	'',	'',	NULL,	NULL),
(163,	'lead_bio_fields_id',	'',	'',	'',	'',	NULL,	NULL),
(164,	'datatype_id',	'',	'',	'',	'',	NULL,	NULL),
(165,	'Data Type ID',	'',	'',	'',	'',	NULL,	NULL),
(166,	'lead_bio_fields_name',	'',	'',	'',	'',	NULL,	NULL),
(167,	'datatype_name',	'',	'',	'',	'',	NULL,	NULL),
(168,	'is_field_unique',	'',	'',	'',	'',	NULL,	NULL),
(169,	'is_field_null',	'',	'',	'',	'',	NULL,	NULL),
(170,	'milestone_name',	'',	'',	'',	'',	NULL,	NULL),
(171,	'insert_after',	'',	'',	'',	'',	NULL,	NULL),
(172,	'assessment_period_in_days',	'',	'',	'',	'',	NULL,	NULL),
(173,	'assessment_review_status',	'',	'',	'',	'',	NULL,	NULL),
(174,	'user_customized_review_status',	'',	'',	'',	'',	NULL,	NULL),
(175,	'Progress_Measure_title',	'',	'',	'',	'',	NULL,	NULL),
(176,	'verification_tool',	'',	'',	'',	'',	NULL,	NULL),
(177,	'assessment_method',	'',	'',	'',	'',	NULL,	NULL),
(178,	'compassion_connect_mapping',	'',	'',	'',	'',	NULL,	NULL),
(179,	'lead_score_parameter',	'',	'',	'',	'',	NULL,	NULL),
(180,	'lead_score_stage',	'',	'',	'',	'',	NULL,	NULL),
(181,	'Label Not Provided',	'',	'',	'',	'',	NULL,	NULL);

CREATE TABLE `lead_bio_fields` (
  `lead_bio_fields_id` int(100) NOT NULL AUTO_INCREMENT,
  `lead_bio_fields_name` varchar(100) NOT NULL,
  `datatype_id` int(100) NOT NULL,
  `is_field_unique` int(5) NOT NULL DEFAULT '1',
  `is_field_null` int(5) NOT NULL DEFAULT '0',
  `default_value` varchar(20) NOT NULL,
  PRIMARY KEY (`lead_bio_fields_id`),
  KEY `datatype_id` (`datatype_id`),
  CONSTRAINT `lead_bio_fields_ibfk_1` FOREIGN KEY (`datatype_id`) REFERENCES `datatype` (`datatype_id`),
  CONSTRAINT `lead_bio_fields_ibfk_2` FOREIGN KEY (`datatype_id`) REFERENCES `datatype` (`datatype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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

CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `created_by` int(5) NOT NULL,
  `last_modified_by` int(5) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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

-- 2019-05-28 03:45:31
