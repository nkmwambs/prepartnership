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
  `leads_bio_information_id` int(100) NOT NULL,
  `assessment_milestones_id` int(100) NOT NULL,
  `is_completed` int(5) NOT NULL DEFAULT '0' COMMENT '0-In Progress, 1-Completed',
  `comment` longtext NOT NULL,
  `assessment_created_date` date NOT NULL,
  `assessment_last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `assessment_created_by` int(100) NOT NULL,
  `assessment_last_modified_by` int(100) NOT NULL,
  PRIMARY KEY (`assessment_id`),
  KEY `assessment_milestones_id` (`assessment_milestones_id`),
  KEY `leads_bio_information_id` (`leads_bio_information_id`),
  KEY `assessment_created_by` (`assessment_created_by`),
  KEY `assessment_last_modified_by` (`assessment_last_modified_by`),
  CONSTRAINT `assessment_ibfk_2` FOREIGN KEY (`assessment_milestones_id`) REFERENCES `assessment_milestones` (`assessment_milestones_id`),
  CONSTRAINT `assessment_ibfk_3` FOREIGN KEY (`leads_bio_information_id`) REFERENCES `leads_bio_information` (`leads_bio_information_id`),
  CONSTRAINT `assessment_ibfk_4` FOREIGN KEY (`assessment_created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `assessment_ibfk_5` FOREIGN KEY (`assessment_last_modified_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment` (`assessment_id`, `leads_bio_information_id`, `assessment_milestones_id`, `is_completed`, `comment`, `assessment_created_date`, `assessment_last_modified_date`, `assessment_created_by`, `assessment_last_modified_by`) VALUES
(16,	16,	25,	0,	'This has been quite a nice job',	'2020-01-23',	'2020-01-23 21:11:01',	1,	1);

DROP TABLE IF EXISTS `assessment_method`;
CREATE TABLE `assessment_method` (
  `assessment_method_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_progress_measure_id` int(3) NOT NULL,
  `method_id` int(100) NOT NULL,
  PRIMARY KEY (`assessment_method_id`),
  KEY `assessment_progress_measure_id` (`assessment_progress_measure_id`),
  KEY `method_id` (`method_id`),
  CONSTRAINT `assessment_method_ibfk_1` FOREIGN KEY (`assessment_progress_measure_id`) REFERENCES `assessment_progress_measure` (`assessment_progress_measure_id`),
  CONSTRAINT `assessment_method_ibfk_2` FOREIGN KEY (`method_id`) REFERENCES `method` (`method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_method` (`assessment_method_id`, `assessment_progress_measure_id`, `method_id`) VALUES
(1,	1,	1),
(2,	1,	2),
(3,	1,	3),
(4,	1,	4),
(5,	2,	1),
(6,	2,	2),
(7,	2,	3),
(8,	2,	4),
(9,	3,	1),
(10,	3,	2),
(11,	3,	3),
(12,	3,	4),
(16,	4,	1),
(17,	4,	2),
(18,	4,	3),
(19,	4,	4),
(23,	5,	1),
(24,	5,	2),
(25,	5,	3),
(26,	5,	4),
(30,	6,	1),
(31,	6,	2),
(32,	6,	3),
(33,	6,	4),
(37,	7,	1),
(38,	7,	2),
(39,	7,	3),
(40,	7,	4),
(44,	8,	1),
(45,	8,	2),
(46,	8,	3),
(47,	8,	4),
(51,	9,	1),
(52,	9,	2),
(53,	9,	3),
(54,	9,	4),
(58,	10,	1),
(59,	10,	2),
(60,	10,	3),
(61,	10,	4);

DROP TABLE IF EXISTS `assessment_milestones`;
CREATE TABLE `assessment_milestones` (
  `assessment_milestones_id` int(3) NOT NULL AUTO_INCREMENT,
  `milestone_name` varchar(20) NOT NULL,
  `milestones_insert_after_id` int(100) NOT NULL,
  `assessment_period_in_days` int(5) NOT NULL,
  `assessment_review_status` varchar(50) NOT NULL,
  `user_customized_review_status` varchar(50) NOT NULL,
  `assessment_milestone_initial` varchar(10) NOT NULL,
  `is_initial_milestone` int(11) NOT NULL DEFAULT '0' COMMENT '0 - Not Initial, 1-Initial',
  `is_final_milestone` int(11) NOT NULL DEFAULT '0' COMMENT '0 - Not final, 1- Final',
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  PRIMARY KEY (`assessment_milestones_id`),
  KEY `milestones_insert_after_id` (`milestones_insert_after_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_milestones` (`assessment_milestones_id`, `milestone_name`, `milestones_insert_after_id`, `assessment_period_in_days`, `assessment_review_status`, `user_customized_review_status`, `assessment_milestone_initial`, `is_initial_milestone`, `is_final_milestone`, `status`) VALUES
(1,	'New Lead',	0,	0,	'New Lead',	'New Lead',	'NA',	0,	0,	1),
(25,	'Initial Assessment',	1,	30,	'Initial Assessment In Progress',	'',	'IA',	1,	0,	1),
(26,	'Mid 1 Assessment',	25,	30,	'Mid 1 Assessment In Progress',	'',	'M1',	0,	0,	1),
(27,	'Mid 2 Assessment',	26,	30,	'Mid 2 Assessment In Progress',	'',	'M2',	0,	0,	1),
(28,	'Mid 3 Assessment',	27,	30,	'Mid 3 Assessment In Progress',	'',	'M3',	0,	0,	1),
(29,	'Summative Assessment',	28,	30,	'Summative Assessment In Progress',	'',	'SA',	0,	1,	1);

DROP TABLE IF EXISTS `assessment_progress_measure`;
CREATE TABLE `assessment_progress_measure` (
  `assessment_progress_measure_id` int(3) NOT NULL AUTO_INCREMENT,
  `progress_measure_title` varchar(100) NOT NULL,
  `verification_tool` longtext NOT NULL,
  `weight` int(3) NOT NULL,
  `assessment_method` longtext NOT NULL,
  `compassion_connect_mapping` varchar(50) NOT NULL,
  `status` int(5) NOT NULL DEFAULT '1' COMMENT '0=suspended,1=active',
  PRIMARY KEY (`assessment_progress_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_progress_measure` (`assessment_progress_measure_id`, `progress_measure_title`, `verification_tool`, `weight`, `assessment_method`, `compassion_connect_mapping`, `status`) VALUES
(1,	'Measure 1',	'De',	6,	'De',	'3',	1),
(2,	'Measure 2',	'De',	3,	'De',	'2',	1),
(3,	'Measure 3',	'Test',	3,	'Test',	'2',	1),
(4,	'Measure 4',	'Test 2',	3,	'Test4',	'1',	1),
(5,	'Measure 5',	't',	3,	't',	'2',	1),
(6,	'Measure 6',	'Test',	2,	'Test',	'1',	1),
(7,	'Measure 7',	'No match',	5,	'No match',	'1',	1),
(8,	'Measure 8',	'Test',	2,	'Test',	'1',	1),
(9,	'Measure 9',	'test',	1,	'test',	'1',	1),
(10,	'Measure 10',	'Test55',	3,	'Test55',	'1',	1);

DROP TABLE IF EXISTS `assessment_result`;
CREATE TABLE `assessment_result` (
  `assessment_result_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(100) NOT NULL,
  `assessment_progress_measure_id` int(3) NOT NULL,
  `score` int(5) NOT NULL,
  `comment` longtext NOT NULL,
  `assessment_result_created_date` date NOT NULL,
  `assessment_result_last_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`assessment_result_id`),
  KEY `assessment_id` (`assessment_id`),
  KEY `assessment_progress_measure_id` (`assessment_progress_measure_id`),
  CONSTRAINT `assessment_result_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessment` (`assessment_id`),
  CONSTRAINT `assessment_result_ibfk_2` FOREIGN KEY (`assessment_progress_measure_id`) REFERENCES `assessment_progress_measure` (`assessment_progress_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_result` (`assessment_result_id`, `assessment_id`, `assessment_progress_measure_id`, `score`, `comment`, `assessment_result_created_date`, `assessment_result_last_modified_date`) VALUES
(1,	16,	1,	-1,	'Trying it out',	'2020-01-23',	'2020-01-23 21:04:53'),
(2,	16,	6,	1,	'Trying it out again',	'2020-01-23',	'2020-01-23 20:18:45'),
(3,	16,	8,	1,	'Trying',	'2020-01-23',	'2020-01-23 20:54:12');

DROP TABLE IF EXISTS `assessment_result_method`;
CREATE TABLE `assessment_result_method` (
  `assessment_result_method_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_result_id` int(100) NOT NULL,
  `assessment_method_id` int(100) NOT NULL,
  PRIMARY KEY (`assessment_result_method_id`),
  KEY `assessment_result_id` (`assessment_result_id`),
  KEY `assessment_method_id` (`assessment_method_id`),
  CONSTRAINT `assessment_result_method_ibfk_1` FOREIGN KEY (`assessment_result_id`) REFERENCES `assessment_result` (`assessment_result_id`),
  CONSTRAINT `assessment_result_method_ibfk_2` FOREIGN KEY (`assessment_method_id`) REFERENCES `assessment_method` (`assessment_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_result_method` (`assessment_result_method_id`, `assessment_result_id`, `assessment_method_id`) VALUES
(1,	1,	1),
(2,	3,	45),
(3,	3,	46);

DROP TABLE IF EXISTS `assessment_result_tool`;
CREATE TABLE `assessment_result_tool` (
  `assessment_result_tool_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_result_id` int(100) NOT NULL,
  `assessment_verification_tool_id` int(100) NOT NULL,
  PRIMARY KEY (`assessment_result_tool_id`),
  KEY `assessment_result_id` (`assessment_result_id`),
  KEY `assessment_verification_tool_id` (`assessment_verification_tool_id`),
  CONSTRAINT `assessment_result_tool_ibfk_1` FOREIGN KEY (`assessment_result_id`) REFERENCES `assessment_result` (`assessment_result_id`),
  CONSTRAINT `assessment_result_tool_ibfk_2` FOREIGN KEY (`assessment_verification_tool_id`) REFERENCES `assessment_verification_tool` (`assessment_verification_tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_result_tool` (`assessment_result_tool_id`, `assessment_result_id`, `assessment_verification_tool_id`) VALUES
(1,	1,	1),
(2,	1,	3),
(3,	2,	36);

DROP TABLE IF EXISTS `assessment_verification_tool`;
CREATE TABLE `assessment_verification_tool` (
  `assessment_verification_tool_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_progress_measure_id` int(3) NOT NULL,
  `verification_tool_id` int(100) NOT NULL,
  PRIMARY KEY (`assessment_verification_tool_id`),
  KEY `assessment_progress_measure_id` (`assessment_progress_measure_id`),
  KEY `verification_tool_id` (`verification_tool_id`),
  CONSTRAINT `assessment_verification_tool_ibfk_1` FOREIGN KEY (`assessment_progress_measure_id`) REFERENCES `assessment_progress_measure` (`assessment_progress_measure_id`),
  CONSTRAINT `assessment_verification_tool_ibfk_2` FOREIGN KEY (`verification_tool_id`) REFERENCES `verification_tool` (`verification_tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_verification_tool` (`assessment_verification_tool_id`, `assessment_progress_measure_id`, `verification_tool_id`) VALUES
(1,	1,	1),
(2,	1,	2),
(3,	1,	3),
(4,	1,	4),
(5,	2,	1),
(6,	2,	2),
(8,	2,	4),
(12,	3,	1),
(13,	3,	2),
(14,	3,	3),
(15,	3,	4),
(19,	4,	1),
(20,	4,	2),
(21,	4,	3),
(22,	4,	4),
(26,	5,	1),
(27,	5,	2),
(28,	5,	3),
(29,	5,	4),
(33,	6,	1),
(34,	6,	2),
(35,	6,	3),
(36,	6,	4),
(40,	7,	1),
(41,	7,	2),
(42,	7,	3),
(43,	7,	4),
(47,	8,	1),
(48,	8,	2),
(49,	8,	3),
(50,	8,	4),
(54,	9,	1),
(55,	9,	2),
(56,	9,	3),
(57,	9,	4),
(61,	10,	1),
(62,	10,	2),
(63,	10,	3),
(64,	10,	4);

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('02ong6e8oj0uf5t57k7ilnhlets98i2e',	'::1',	1562660574,	'__ci_last_regenerate|i:1562660574;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('05qc5u292ejgpb29r7dih1g9boen26sd',	'::1',	1579798353,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579798353;view_type|s:5:\"leads\";'),
('06hcl35dbnehtsp460hj8a760d9cii09',	'::1',	1579805631,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579805631;view_type|s:5:\"leads\";'),
('0h1snpq0dfv9u9kb4h5it7ufvg8blvd8',	'::1',	1562568794,	'__ci_last_regenerate|i:1562568794;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('0j14bhigls273kt1vu6buq71ltdtrmcb',	'::1',	1562751825,	'__ci_last_regenerate|i:1562751825;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('0kgb2s6kpeub0dl9eo59jk2p6vii8ba3',	'::1',	1562663633,	'__ci_last_regenerate|i:1562663633;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('0mfuoea663c4r595ao2dd6qftkhjvvra',	'::1',	1562764939,	'__ci_last_regenerate|i:1562764731;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('12qbd56umn11kk34d7tg9b8p5ln5gndt',	'::1',	1561387644,	'__ci_last_regenerate|i:1561387644;view_type|s:9:\"dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('18m7li6uf9hpnl51u1a3sschulllha2t',	'::1',	1562568375,	'__ci_last_regenerate|i:1562568375;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('18ol6hat9fkik07o6f7ghbklft1q656i',	'::1',	1561381962,	'__ci_last_regenerate|i:1561381962;'),
('1cf2g9l1utf7qn9rl5jjcq61ph1101hh',	'::1',	1579808297,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579808297;view_type|s:5:\"leads\";'),
('1fknsu4sbsoap6m8gn7gav823bovhrq2',	'::1',	1562747394,	'__ci_last_regenerate|i:1562747394;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('1fm1mbt933ghbdhiv4a7hcisk3v6vf24',	'::1',	1561384050,	'__ci_last_regenerate|i:1561384050;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('1fo8b2n4ajta4grk9bvokb44h25puoqo',	'::1',	1562764318,	'__ci_last_regenerate|i:1562764318;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('1h27va18fog3gs06alkrkamcu8v7ee29',	'::1',	1579804512,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579804512;view_type|s:5:\"leads\";'),
('1j5kin9t5e9a6gngo8q2293qu2ivjg30',	'::1',	1562523430,	'__ci_last_regenerate|i:1562523222;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('1rsmse6f74muk92r85g8vpqm3u8r08o2',	'::1',	1562613235,	'__ci_last_regenerate|i:1562613235;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('1vvdrnci0qvfmp5ngiaq02pc53e5rauh',	'::1',	1562751994,	'__ci_last_regenerate|i:1562751985;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('2n1ietaglfqkhuf77sn6pa71kfeo4u2v',	'::1',	1562750296,	'__ci_last_regenerate|i:1562750296;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('2nko6pnmmc9pab23msp0qo7as2pvh1g5',	'::1',	1562763976,	'__ci_last_regenerate|i:1562763976;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('35o7c5vjkc6nl2h31gdp2ma7ku1bvqnt',	'::1',	1579812665,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579812665;view_type|s:5:\"leads\";'),
('3dja0eecou0vi0nm0f28o38qqsu2hrdt',	'::1',	1562659722,	'__ci_last_regenerate|i:1562659722;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('3dvjqf61q917b6e9a8po7okkq8equip9',	'::1',	1562042048,	'__ci_last_regenerate|i:1562042048;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('3u0cf595jpc0se9679f7vqqac5fv7dui',	'::1',	1579807393,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579807393;view_type|s:5:\"leads\";'),
('3vo98e9ehtt7g7f8v3ep56f70nbj6prg',	'::1',	1562571354,	'__ci_last_regenerate|i:1562571354;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('4gsqro478vrd7qi656cea7fmfv69lvkg',	'::1',	1562572211,	'__ci_last_regenerate|i:1562572211;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('4hh1jkmm1g3t2vpvcsft1uar220i3clg',	'::1',	1579804836,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579804836;view_type|s:5:\"leads\";'),
('4no8akbtadjgg0q3205313c2nhtvs0g4',	'::1',	1579803875,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579803875;view_type|s:5:\"leads\";'),
('4ofgt5o3ncl2e8luld9rbsqmimk9ookr',	'::1',	1562654955,	'__ci_last_regenerate|i:1562654955;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('53osdcn84g7ar7v31p11dfp7m9p8qrg7',	'::1',	1579798774,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579798774;view_type|s:5:\"leads\";'),
('57lvfi17kb5einvt00ojss3pq00cin93',	'::1',	1561385301,	'__ci_last_regenerate|i:1561385301;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('5dkhnjvalo4lc5g5tvs4i6qvg3ko1a0r',	'::1',	1579810580,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579810580;view_type|s:5:\"leads\";'),
('5g7cj1aljl06gu3gup4cqa1fvev8aq36',	'::1',	1561383686,	'__ci_last_regenerate|i:1561383686;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('5jt5c9muu47gv90ivl79pt5tf1mr47k3',	'::1',	1562613261,	'__ci_last_regenerate|i:1562613235;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('5l5470otehj6lih9nol6vits788ahjoj',	'::1',	1579773750,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579773750;view_type|s:5:\"leads\";'),
('5lfvjoup3eouthjhmtbu7fu6srfb5ttv',	'::1',	1579779084,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579779084;view_type|s:5:\"leads\";'),
('5rpv7qm3c32m9l44h8kl4mo31vv3n0q3',	'::1',	1579787435,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579787435;view_type|s:5:\"leads\";'),
('64m2ngedalksiv0bpd8j622j5ea777bd',	'::1',	1566815519,	'__ci_last_regenerate|i:1566815501;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('6746s9unp8habpg9ndhqqssivsvkmtal',	'::1',	1562748902,	'__ci_last_regenerate|i:1562748902;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('6e5huet9efnu6cg5p0n5jfqq48hdbbp5',	'::1',	1562570854,	'__ci_last_regenerate|i:1562570854;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('6kpbcfe3mvv056kurnsr816gnnpavjrd',	'::1',	1562667908,	'__ci_last_regenerate|i:1562667655;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('6ldfa2fvr1p17qmcth9t0h94hkau38g0',	'::1',	1579797980,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579797980;view_type|s:5:\"leads\";'),
('6m22teungfpsmp979tr4h2sujgc9isub',	'::1',	1579800500,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579800500;view_type|s:5:\"leads\";'),
('6p0hvsdsppti5rs92uk81ini638mv61o',	'::1',	1561402353,	'__ci_last_regenerate|i:1561402353;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('6ro31lqb7vlaneam9f2l8o8sbukh8ao6',	'::1',	1562756297,	'__ci_last_regenerate|i:1562756297;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('6uai56klbjenvk7rmrd3r419vk0t7mmh',	'::1',	1562664053,	'__ci_last_regenerate|i:1562664053;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('6v11fj0oa7snolb0b30voj8dck9cdmq0',	'::1',	1579776000,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579776000;view_type|s:5:\"leads\";'),
('709co5m3g4in730fqtbs2gcn61isjcoo',	'::1',	1562072745,	'__ci_last_regenerate|i:1562072731;view_type|s:9:\"dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('7198neer683co1cc4hv3peas8ube5547',	'::1',	1562666523,	'__ci_last_regenerate|i:1562666523;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('7201eegdgi1skn6uti5mqsu184vhm5q2',	'::1',	1579807756,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579807756;view_type|s:5:\"leads\";'),
('72f6vjudan0ftf8g80or6jf2cokdbh3c',	'::1',	1566816828,	'__ci_last_regenerate|i:1566816568;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('72snki2oqmia998f6i637ouf1pl1d73k',	'::1',	1562749541,	'__ci_last_regenerate|i:1562749541;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('78cr9lr32jqgag3gs55fl90le1pb5d9f',	'::1',	1562748472,	'__ci_last_regenerate|i:1562748472;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('7ahq3j599scmamos8eaj0s0ip5r8j0dn',	'::1',	1579778591,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579778591;view_type|s:5:\"leads\";'),
('7b2jdcqag4qlsmuj6s44eke98ofd71a7',	'::1',	1561401277,	'__ci_last_regenerate|i:1561401277;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('7foi4bg15939oa5ds6h2qpeegjovntp2',	'::1',	1562041743,	'__ci_last_regenerate|i:1562041743;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('7hqv1nfsr6f4akedd5svlibl99khbs2o',	'::1',	1562754637,	'__ci_last_regenerate|i:1562754637;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('7ltg0vkoajo27e94o1pqf0al599m3cfe',	'::1',	1561552946,	'__ci_last_regenerate|i:1561552922;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('81ifnppcn4seveohdk2fm53rq99framj',	'::1',	1561401622,	'__ci_last_regenerate|i:1561401622;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('8lnkervd2jmbc4b4coqvoigf1a2phiql',	'::1',	1579806690,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579806690;view_type|s:5:\"leads\";'),
('8q5m7vkralc66a7qi712tf6kll3alkf1',	'::1',	1579786125,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579786125;view_type|s:5:\"leads\";'),
('8q90s5d49m4e8hefh31rrrl780uvddal',	'::1',	1579777878,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579777878;view_type|s:5:\"leads\";'),
('8rh2r6f7p02lhags99sdtehudf4p6ngt',	'::1',	1561385631,	'__ci_last_regenerate|i:1561385631;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('8ucq9eg70pf5gns6oh5h3m69dfueqrs3',	'::1',	1562611715,	'__ci_last_regenerate|i:1562611715;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('8vf4hbkjqvtqh5sjqn5653nuoqeggph3',	'::1',	1562653774,	'__ci_last_regenerate|i:1562653774;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('9260qajqqapqknml654gr0tl1uasrulp',	'::1',	1579773298,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579773298;view_type|s:5:\"leads\";'),
('96de8rqt9t7gdjci9ri44idarbrvrcfb',	'::1',	1579809600,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579809600;view_type|s:5:\"leads\";'),
('9784q18as1ir1dir9mr78c3sn3agh7lj',	'::1',	1579813472,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579813472;view_type|s:5:\"leads\";'),
('98geo42njtj5ha868ghuo5lkt8lqlo9i',	'::1',	1566816568,	'__ci_last_regenerate|i:1566816568;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('98rtbqj8tpk51d1r80h1nvvlr82ld02i',	'::1',	1579803538,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579803538;view_type|s:5:\"leads\";'),
('9bjc49uu9f94dmuo6c7uvoqu58g7ddn1',	'::1',	1579813944,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579813779;view_type|s:5:\"leads\";'),
('9nn7o4058s40ecnrqootmobg4v7s0212',	'::1',	1579806998,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579806998;view_type|s:5:\"leads\";'),
('9t4d28vjl4e2tmlsthntk19k5e5f704l',	'::1',	1561402390,	'__ci_last_regenerate|i:1561402353;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('adnnplr8vijcahuuq1dnthpucopof77b',	'::1',	1562755271,	'__ci_last_regenerate|i:1562755271;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('ahag29lsel155867godlcb4lib7j0dl9',	'::1',	1562657140,	'__ci_last_regenerate|i:1562657140;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('apn0spc3b58pjvorunuvj5d5hhfc7rjq',	'::1',	1562566364,	'__ci_last_regenerate|i:1562566364;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('av2dvf13d4echnpef744a4kllgm0qmvg',	'::1',	1579776917,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579776917;view_type|s:5:\"leads\";'),
('b0j4qqu7ofr19fen98tionrjrp7hc6ef',	'::1',	1566821258,	'__ci_last_regenerate|i:1566821257;view_type|s:8:\"settings\";'),
('b9dj2gm6icc171hfa1fte9gv2fi3eeta',	'::1',	1562583964,	'__ci_last_regenerate|i:1562583787;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('bintous9im1vhc21diu4n33hollmerkp',	'::1',	1561386312,	'__ci_last_regenerate|i:1561386312;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('c0f722pujj4lj9lsfump8m4bq045b624',	'::1',	1562044192,	'__ci_last_regenerate|i:1562044192;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('c27g65mrmg2lfn3nloksdd3a8jab0112',	'::1',	1562655617,	'__ci_last_regenerate|i:1562655617;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('c3mrq4jlpci2fuhgekr61i0dk5nki7rm',	'::1',	1562751985,	'__ci_last_regenerate|i:1562751985;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('c4ok18dp7o0r8f5bqc1rn49mkrg0lcq6',	'::1',	1562666209,	'__ci_last_regenerate|i:1562666209;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('chgn0vb81tdg14dbvdmq9qr7i4so0hn3',	'::1',	1579796965,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579796965;view_type|s:5:\"leads\";'),
('chjmedrqakrjrl4oud0fdehhungv9jf6',	'::1',	1562746743,	'__ci_last_regenerate|i:1562746743;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('ckqn2o2b0m0ehebgr719oea1u4joui6c',	'::1',	1579808610,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579808610;view_type|s:5:\"leads\";'),
('cl5tfbip6kkul32ts83nbcmc87vlt8he',	'::1',	1579787780,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579787780;view_type|s:5:\"leads\";'),
('d2tt5ta8lme32ta4nss80aujdnk9ei04',	'::1',	1579805192,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579805192;view_type|s:5:\"leads\";'),
('das0u9f50581sonhkj4a16lcjg957eep',	'::1',	1579799088,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579799088;view_type|s:5:\"leads\";'),
('dcn0g6itkmqrmgenretobssu7b6uuj35',	'::1',	1561493731,	'__ci_last_regenerate|i:1561493731;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('ddj9s1rt7aku9229fa3l3adjkfdgggvl',	'::1',	1562572854,	'__ci_last_regenerate|i:1562572854;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('di9ulr7rrrng0mg8ic7l522fm46cd559',	'::1',	1579797294,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579797294;view_type|s:5:\"leads\";'),
('dlgdhfle692g3gos3jobn94knphfo5fh',	'::1',	1579804200,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579804200;view_type|s:5:\"leads\";'),
('dmtama6730ei6bb4iaagfmgnr2cemqjr',	'::1',	1566816178,	'__ci_last_regenerate|i:1566816178;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('dnfld9kia85q3rkub9ivtd5ovder5475',	'::1',	1562016097,	'__ci_last_regenerate|i:1562016097;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('dpf4o1j2s9ek647inqo1c2e8gl3imjuf',	'::1',	1579788135,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579788135;view_type|s:5:\"leads\";'),
('e509o7bs05tnuh8eanf8r4mfnl38hhhg',	'::1',	1579763834,	'__ci_last_regenerate|i:1579762928;'),
('eai3a1bdal89hotb3dkhsukuqiolvmis',	'::1',	1579774818,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579774818;view_type|s:5:\"leads\";'),
('ed45ictc1f194klm51f3pjslikopb9aq',	'::1',	1561388269,	'__ci_last_regenerate|i:1561388269;view_type|s:9:\"dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('ee8rv35sacp026uiudice2cedc3g22hs',	'::1',	1562015252,	'__ci_last_regenerate|i:1562015252;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('efijakinr9jp782ks6udp6s728b20etv',	'::1',	1562610926,	'__ci_last_regenerate|i:1562610926;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('emc6a3qfc1okue6u9hbttqhmenrrvkvv',	'::1',	1562755987,	'__ci_last_regenerate|i:1562755987;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('f68u8or4s92p9t454tfbvrpacau3521n',	'::1',	1562747049,	'__ci_last_regenerate|i:1562747049;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('f8673msbdjso2gkuqh85op017d0bq80t',	'::1',	1562522501,	'__ci_last_regenerate|i:1562522485;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('fc9o49i7pb6kra2gh8qf4fmum5hq03kh',	'::1',	1562044733,	'__ci_last_regenerate|i:1562044508;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('fe2b0l9bhlps98eufkhcbn2v3r5a7sqd',	'::1',	1562572854,	'__ci_last_regenerate|i:1562572854;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('ff2r98endqncprcnqnltudhbg7sio0ff',	'::1',	1562069527,	'__ci_last_regenerate|i:1562069508;view_type|s:9:\"dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('fk4grrc35r307eviad5ua03au7i85m0n',	'::1',	1579790235,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579790235;view_type|s:5:\"leads\";'),
('fk8fhhqsbfenqbv2j9trt5kmgaj7cdj8',	'::1',	1579801115,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579801115;view_type|s:5:\"leads\";'),
('fkt5dq1dt5orilve4sd64864mjuln1uh',	'::1',	1562657921,	'__ci_last_regenerate|i:1562657921;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('fpkr6s7d6gkp9aiide9es735qoe9fv0i',	'::1',	1562043878,	'__ci_last_regenerate|i:1562043878;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('fs257qnnmahq8tmci3686i6biq3rqsi0',	'::1',	1562660918,	'__ci_last_regenerate|i:1562660918;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('gcdeecb5gfou8aeu0kjctoc0giekt9a8',	'::1',	1562763642,	'__ci_last_regenerate|i:1562763642;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('gdil691ei55eiopkr30pfb76cmsno92m',	'::1',	1579775591,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579775591;view_type|s:5:\"leads\";'),
('gf6j5dug8ijmefim0keckt0b685s8ath',	'::1',	1579780593,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579780593;view_type|s:5:\"leads\";'),
('gh7fdalg6m54196hioit78p6om4f5ndu',	'::1',	1562569427,	'__ci_last_regenerate|i:1562569427;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('gji5hc5vo0nsfi3ph4u1lmifublh59i8',	'::1',	1562654219,	'__ci_last_regenerate|i:1562654219;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('gk34qmjieqnipbtdkrfkaaakvjq1srqq',	'::1',	1562759295,	'__ci_last_regenerate|i:1562759295;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('gsd3fv6glravadaihfit341k3fblshic',	'::1',	1562522485,	'__ci_last_regenerate|i:1562522485;'),
('gt38mknk9dhntnov7mifr13e1oblanfu',	'::1',	1562572551,	'__ci_last_regenerate|i:1562572551;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('gt3d178810mivg0sfpm1d22b06movigd',	'::1',	1562570118,	'__ci_last_regenerate|i:1562570118;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('h3k3g4gcuqofho0d5bgee47foslkuea7',	'::1',	1579779804,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579779804;view_type|s:5:\"leads\";'),
('h44olfj8jm6hkhuvh2ojdg3gvi02i9dh',	'::1',	1562654649,	'__ci_last_regenerate|i:1562654649;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('hbtg8m6ge4kme10s5k3r3a45i8oivaii',	'::1',	1579791356,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579791356;view_type|s:5:\"leads\";'),
('hghmj0tou7o6k6tdkk5iebgkcf1dludt',	'::1',	1562664356,	'__ci_last_regenerate|i:1562664356;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('hh22a8u3ko31sjq23tegal5cc4t76a54',	'::1',	1562757466,	'__ci_last_regenerate|i:1562757466;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('hhe0higun3jikv4a4hnr43ef055osg0f',	'::1',	1562752200,	'__ci_last_regenerate|i:1562752200;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('hif89t6c412m4evpf60opb66dlah7jas',	'::1',	1562748165,	'__ci_last_regenerate|i:1562748165;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('hkpqurq5dr08pse4td9aucepmrv375k4',	'::1',	1579790563,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579790563;view_type|s:5:\"leads\";'),
('hofgth396fc6onugn91diobsn7c1ebfp',	'::1',	1562749889,	'__ci_last_regenerate|i:1562749889;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('hplmp4i0i9svvdktru2r2bpvejhtv5rb',	'::1',	1562612049,	'__ci_last_regenerate|i:1562612049;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('hsp7i8rcsfrbuhsogj3ktpc609h10vu2',	'::1',	1562656369,	'__ci_last_regenerate|i:1562656369;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('huhj5u6anc0j7rj11u4bcu4j7s2n1aai',	'::1',	1579813779,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579813779;view_type|s:5:\"leads\";'),
('i6mcp838boin5nljlpi1ra02fn695sr5',	'::1',	1579806304,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579806304;view_type|s:5:\"leads\";'),
('i88mdpqu6mt91sq4v3e731gokn6f5jci',	'::1',	1562655923,	'__ci_last_regenerate|i:1562655923;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('iv7da2e44dkfgk53325g8cr6ahfc0q5l',	'::1',	1562754323,	'__ci_last_regenerate|i:1562754323;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('j7ig08q75u9932i2ht5l7k9nmq04snmr',	'::1',	1579800801,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579800801;view_type|s:5:\"leads\";'),
('j987safeftpd9bscqlo98h2hgpldfcsu',	'::1',	1562749136,	'__ci_last_regenerate|i:1562749136;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('jtl135ep3bpv76l4beb7jhfb37gkf0kd',	'::1',	1562667218,	'__ci_last_regenerate|i:1562667218;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('judi4niu0jsrpev1ndd3901l5jkhutoc',	'::1',	1562658416,	'__ci_last_regenerate|i:1562658416;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('k0625dbici5201ce1v0j8isb5t6pj3nu',	'::1',	1579790915,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579790915;view_type|s:5:\"leads\";'),
('k1dqrbci8s976m1ha06i7am8s8ug46ee',	'::1',	1562663270,	'__ci_last_regenerate|i:1562663270;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('k3hf4ubn3542ssi0orlkr196oburceih',	'::1',	1561384357,	'__ci_last_regenerate|i:1561384357;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('k8k1c88ltk4v95cflbnmvlm5s3l6r38c',	'::1',	1579778204,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579778204;view_type|s:5:\"leads\";'),
('kbo262d0nc1t1gpkt56ojpd6b89agf4u',	'::1',	1562753988,	'__ci_last_regenerate|i:1562753988;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('kndfvh909h8ad91fqvjh611dngq9ie7h',	'::1',	1562041028,	'__ci_last_regenerate|i:1562041028;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('kntcqgm5pdga1mb5vnj606710t3hkq91',	'::1',	1562012058,	'__ci_last_regenerate|i:1562012058;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('kph1sguqkbu1bcg6md631hurvnbp2j9h',	'::1',	1562569801,	'__ci_last_regenerate|i:1562569801;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('kre7me3q9p5s63d1g10aes2cmt7ka2kr',	'::1',	1562661235,	'__ci_last_regenerate|i:1562661235;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('l0dvd9rlt0m3gmu9am7mb2p51ajs67sq',	'::1',	1561386916,	'__ci_last_regenerate|i:1561386648;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('l5stu2c5enhsknh3f3qdc2erac00vfdi',	'::1',	1562655262,	'__ci_last_regenerate|i:1562655262;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('l91su1j0qbc75u5fr75pkmp1lb9ogj00',	'::1',	1579776468,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579776468;view_type|s:5:\"leads\";'),
('leh37f4si75tr64u6ek0kpnit25gjh3p',	'::1',	1579777424,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579777424;view_type|s:5:\"leads\";'),
('m00htcp8fbuh01sd4nl1716b5bmigib9',	'::1',	1561384690,	'__ci_last_regenerate|i:1561384690;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('m133akt6u7cs1mvcuto3lhubktsorbml',	'::1',	1562756760,	'__ci_last_regenerate|i:1562756760;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('m2aasm72bpsm0f47olca40dsggm3aq8s',	'::1',	1562016712,	'__ci_last_regenerate|i:1562016712;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('m62fjs04lhqslrjkrfpjt30nsph8cabb',	'::1',	1579785812,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579785812;view_type|s:5:\"leads\";'),
('mca3o2gn8a26dgb2j46h4e0nos1v5m3j',	'::1',	1579797605,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579797605;view_type|s:5:\"leads\";'),
('meugismqf3l4p3ofbnhetab2pv2v0dh5',	'::1',	1562758393,	'__ci_last_regenerate|i:1562758393;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('mmttonl8t0n6bf06rcjtis5tidu76g2g',	'::1',	1579785342,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579785342;view_type|s:5:\"leads\";'),
('mu230nf8curcvjat77b50b7acc59u2o4',	'::1',	1562041405,	'__ci_last_regenerate|i:1562041405;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('n74t9hmn9rag99u93tohk5ndba1d8gub',	'::1',	1562569114,	'__ci_last_regenerate|i:1562569114;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('n8ub7i5bkd8v6sm77ar9irvd48p7r5ib',	'::1',	1562753613,	'__ci_last_regenerate|i:1562753613;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('ncscn4bpev35grb0v2crgcj38etuv1qa',	'::1',	1562659417,	'__ci_last_regenerate|i:1562659417;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('nemchavu4srl2mjh1pv64b1jr3lds42h',	'::1',	1562764731,	'__ci_last_regenerate|i:1562764731;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('nepmfd5khq52cqfc5kf4i6cm484deifu',	'::1',	1562612373,	'__ci_last_regenerate|i:1562612373;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('ni1eueuaj76ghs28eq2go25ckn3bsb38',	'::1',	1561387950,	'__ci_last_regenerate|i:1561387950;view_type|s:9:\"dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('ni9f6kdgepkoopf9o0pftqho0n7s2g1h',	'::1',	1562755666,	'__ci_last_regenerate|i:1562755666;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('nibm264ka54vcf322t65vtdsbp5kaasp',	'::1',	1562753150,	'__ci_last_regenerate|i:1562753150;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('nunabit1sj9gk23q2grjhv66tgl2u3q7',	'::1',	1561494164,	'__ci_last_regenerate|i:1561494164;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('o1u4do0ngim7db5f9chfa90lmar8encl',	'::1',	1562653405,	'__ci_last_regenerate|i:1562653405;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('o83he9srlfckep9pn48j0vfi4lgft1g0',	'::1',	1561446087,	'__ci_last_regenerate|i:1561446087;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('oeimgr1bjlcnjl5cmlb1lphr38dr8rj1',	'::1',	1562042476,	'__ci_last_regenerate|i:1562042476;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('opda0put0pa1viaeeual0gde98fifek6',	'::1',	1562660079,	'__ci_last_regenerate|i:1562660079;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('ot7mjt37ig0rukedmvbfho09hrn10rdl',	'::1',	1562011548,	'__ci_last_regenerate|i:1562011547;'),
('otj8vnnu7ifchdpdujl5a4n7tha85c57',	'::1',	1562754945,	'__ci_last_regenerate|i:1562754945;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('oue9c3d4r4e5uf1h3th2vf2apfiap3dj',	'::1',	1561494284,	'__ci_last_regenerate|i:1561494164;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('p126ce8p7js04h2qpvenlh4k5v3uu2r4',	'::1',	1579812364,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579812364;view_type|s:5:\"leads\";'),
('p6p9ss9b6ik3d8k6jept5kp4turo8jhc',	'::1',	1562748789,	'__ci_last_regenerate|i:1562748789;'),
('pn858fmg15d89gebvti1dfp48boui1ck',	'::1',	1561388269,	'__ci_last_regenerate|i:1561388269;view_type|s:9:\"dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('pvn01fqjhs7kt28efg0i6hnjrc6dstdu',	'::1',	1562016974,	'__ci_last_regenerate|i:1562016712;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('q30ephbjoovqpjifefqii7hvl0niuvbp',	'::1',	1579771785,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579771785;view_type|s:5:\"leads\";'),
('q6uuf8b389blffgrp5rdma0f7v29vh2d',	'::1',	1579775246,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579775246;view_type|s:5:\"leads\";'),
('q9ljj1a560moc9uecg1ou82r2ccaps0k',	'::1',	1579779475,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579779475;view_type|s:5:\"leads\";'),
('qh7kp6l4bmg41hf89hmnceev3g9vsqs4',	'::1',	1562662849,	'__ci_last_regenerate|i:1562662849;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('qoc2td2lc7975f9jvoqiunvv6khtqm6c',	'::1',	1561385933,	'__ci_last_regenerate|i:1561385933;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('qoldndre857lficikh7hh95seostbosr',	'::1',	1562015672,	'__ci_last_regenerate|i:1562015672;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('qroh9rog0s6h2s1o1gj6h15325vsth28',	'::1',	1561400947,	'__ci_last_regenerate|i:1561400947;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('qsfv50qu07uu7qpb30f5bss2jlv2p9bp',	'::1',	1579789931,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579789931;view_type|s:5:\"leads\";'),
('qthg74qv6n0vt8m2lf1ckvb8j6bdsstl',	'::1',	1562758990,	'__ci_last_regenerate|i:1562758990;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('qvf7o0uipv8e9s7sds1eo1auoa0l4n93',	'::1',	1562657607,	'__ci_last_regenerate|i:1562657607;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('r0o0a0nduusvlmal9tpr2nv4s7q24fbj',	'::1',	1579780216,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579780216;view_type|s:5:\"leads\";'),
('r2ae4jmtri262fab4h0u0bilgri2l0jq',	'::1',	1562044508,	'__ci_last_regenerate|i:1562044508;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('r3nqgqecjehgceoho6crd5stg4r5nvt4',	'::1',	1562757161,	'__ci_last_regenerate|i:1562757161;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('r9ucusob0bajvrd0f1tjkjit1p525gko',	'::1',	1562757818,	'__ci_last_regenerate|i:1562757818;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('rb2f3st0lk8ogq0bqie5kmte688ttc2e',	'::1',	1562662007,	'__ci_last_regenerate|i:1562662007;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('rcova72be6tm5aa139bh8fr8hm1j69km',	'::1',	1579809235,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579809235;view_type|s:5:\"leads\";'),
('rj3scgqhkdir5nlfc3l4bmdel7rlv3md',	'::1',	1562747770,	'__ci_last_regenerate|i:1562747770;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('rlmlkkj3bcuj0nkg4uepk88bi71i5p19',	'::1',	1562570524,	'__ci_last_regenerate|i:1562570524;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('rnv7rofdho6clb3ksigrlog33fu1pook',	'::1',	1562748781,	'__ci_last_regenerate|i:1562748781;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('s1d5sgnffcuv2vfafaneplfs8q0pk9e1',	'::1',	1562667655,	'__ci_last_regenerate|i:1562667655;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('sas09t20vmlv6n0tc1k1fe4h2rt37sc5',	'::1',	1579788483,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579788483;view_type|s:5:\"leads\";'),
('sevbkdg97cnf2f2vk25fl3bs05dnfsdl',	'::1',	1561446087,	'__ci_last_regenerate|i:1561446087;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('t1cd3laskr26e6vibf10rlsbdc6dkpot',	'::1',	1562581920,	'__ci_last_regenerate|i:1562581920;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('tj644vh9q9qs9aldp138qp7m8ponit2s',	'::1',	1562611274,	'__ci_last_regenerate|i:1562611274;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('tpf5ub3eri0uan37fkjj8mjbjq24i101',	'::1',	1562612836,	'__ci_last_regenerate|i:1562612836;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('tubfmc10579gkpbk4np8ilanus6q7b0n',	'::1',	1561386648,	'__ci_last_regenerate|i:1561386648;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('u6ptn3kcoo836i4tetrt21oq6v94btfg',	'::1',	1579786469,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579786469;view_type|s:5:\"leads\";'),
('u7641rnqb2fb60rht1adgh8a67ococrg',	'::1',	1579784986,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579784986;view_type|s:5:\"leads\";'),
('ulgpebqk4n9suqk8n1989icidf4u5o6u',	'::1',	1562658823,	'__ci_last_regenerate|i:1562658823;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('uqmht99o4gjnnf7ddt88kc2f6b4gt41h',	'::1',	1562043574,	'__ci_last_regenerate|i:1562043574;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('ur64asbeo93opflmb0ebfd9a0617b89u',	'::1',	1561402040,	'__ci_last_regenerate|i:1561402040;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('uu9gvgtb1s1nf4d0qrm431d8f05ge7uh',	'::1',	1562567956,	'__ci_last_regenerate|i:1562567956;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('v3qvq2igfnmsfe169t7c77q2tlieuu8e',	'::1',	1562763333,	'__ci_last_regenerate|i:1562763333;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('va6hgn7q5ncksh7jfqgclehdlvj4dtr6',	'::1',	1562661540,	'__ci_last_regenerate|i:1562661540;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('vdhakgdc6cjvmsqd9vo3e046vdplrmsq',	'::1',	1562652839,	'__ci_last_regenerate|i:1562652839;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('vdisggkjv5g513hj1gm109moj5ei2a0c',	'::1',	1562582119,	'__ci_last_regenerate|i:1562581920;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('vnv58h7grulkiomdj7epr44hr0n4f795',	'::1',	1579809905,	'user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:9:\"Nicodemus\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";__ci_last_regenerate|i:1579809905;view_type|s:5:\"leads\";');

DROP TABLE IF EXISTS `compassion_connect_mapping`;
CREATE TABLE `compassion_connect_mapping` (
  `compassion_connect_mapping_id` int(3) NOT NULL AUTO_INCREMENT,
  `lead_score_parameter` varchar(50) NOT NULL,
  `lead_score_stage` int(5) NOT NULL,
  PRIMARY KEY (`compassion_connect_mapping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `compassion_connect_mapping` (`compassion_connect_mapping_id`, `lead_score_parameter`, `lead_score_stage`) VALUES
(1,	'No Match',	0),
(2,	'Test 0',	2),
(3,	'Test 2',	1),
(4,	'Test Delete',	2);

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

DROP TABLE IF EXISTS `insert_after_milestone`;
CREATE TABLE `insert_after_milestone` (
  `insert_after_milestone_id` int(3) NOT NULL AUTO_INCREMENT,
  `insert_after_milestone_name` varchar(100) NOT NULL,
  PRIMARY KEY (`insert_after_milestone_id`),
  CONSTRAINT `insert_after_milestone_ibfk_2` FOREIGN KEY (`insert_after_milestone_id`) REFERENCES `assessment_milestones` (`assessment_milestones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `insert_after_milestone` (`insert_after_milestone_id`, `insert_after_milestone_name`) VALUES
(1,	'New Lead');

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
(181,	'Label Not Provided',	'',	'',	'',	'',	NULL,	NULL),
(182,	'Show Field',	'',	'',	'',	'',	NULL,	NULL),
(183,	'leads_information',	'',	'',	'',	'',	NULL,	NULL),
(184,	'Show Field?',	'',	'',	'',	'',	NULL,	NULL),
(185,	'Test1',	'',	'',	'',	'',	NULL,	NULL),
(186,	'Tes2',	'',	'',	'',	'',	NULL,	NULL),
(187,	'Test 3',	'',	'',	'',	'',	NULL,	NULL),
(188,	'test_3',	'',	'',	'',	'',	NULL,	NULL),
(189,	'lead_bio_information',	'',	'',	'',	'',	NULL,	NULL),
(190,	'Assessment Period In Days',	'',	'',	'',	'',	NULL,	NULL),
(191,	'Is Field In Use?',	'',	'',	'',	'',	NULL,	NULL),
(192,	'Is Field In Use',	'',	'',	'',	'',	NULL,	NULL),
(193,	'Assessment Id',	'',	'',	'',	'',	NULL,	NULL),
(194,	'Lead Name',	'',	'',	'',	'',	NULL,	NULL),
(195,	'Email',	'',	'',	'',	'',	NULL,	NULL),
(196,	'assessment_id',	'',	'',	'',	'',	NULL,	NULL),
(197,	'lead_name',	'',	'',	'',	'',	NULL,	NULL),
(198,	'leads_bio_information_id',	'',	'',	'',	'',	NULL,	NULL),
(199,	'lead_bio_info_column',	'',	'',	'',	'',	NULL,	NULL),
(200,	'show_field',	'',	'',	'',	'',	NULL,	NULL),
(201,	'is_suspended',	'',	'',	'',	'',	NULL,	NULL),
(202,	'assessment_milestones_id',	'',	'',	'',	'',	NULL,	NULL),
(203,	'Lead Status',	'',	'',	'',	'',	NULL,	NULL),
(204,	'lead_status',	'',	'',	'',	'',	NULL,	NULL),
(205,	'Kkk',	'',	'',	'',	'',	NULL,	NULL),
(206,	'Lead Contact',	'',	'',	'',	'',	NULL,	NULL),
(207,	'Lead Fax',	'',	'',	'',	'',	NULL,	NULL),
(208,	'lead_contact',	'',	'',	'',	'',	NULL,	NULL),
(209,	'lead_fax_no',	'',	'',	'',	'',	NULL,	NULL),
(210,	'Connnect Leadid',	'',	'',	'',	'',	NULL,	NULL),
(211,	'add_new_record',	'',	'',	'',	'',	NULL,	NULL),
(212,	'action',	'',	'',	'',	'',	NULL,	NULL),
(213,	'general comment',	'',	'',	'',	'',	NULL,	NULL),
(214,	'category',	'',	'',	'',	'',	NULL,	NULL),
(215,	'visibility',	'',	'',	'',	'',	NULL,	NULL),
(216,	'nominate_unit',	'',	'',	'',	'',	NULL,	NULL),
(217,	'comment',	'',	'',	'',	'',	NULL,	NULL),
(218,	'progress_measure',	'',	'',	'',	'',	NULL,	NULL),
(219,	'verication_tools',	'',	'',	'',	'',	NULL,	NULL),
(220,	'method_of_assessment',	'',	'',	'',	'',	NULL,	NULL),
(221,	'score',	'',	'',	'',	'',	NULL,	NULL),
(222,	'functional_strategic_document',	'',	'',	'',	'',	NULL,	NULL),
(223,	'records-review',	'',	'',	'',	'',	NULL,	NULL),
(224,	'focused_discussions',	'',	'',	'',	'',	NULL,	NULL),
(225,	'observation',	'',	'',	'',	'',	NULL,	NULL),
(226,	'documented_selection_process_for_ministry_leaders',	'',	'',	'',	'',	NULL,	NULL),
(227,	'church_organizational_chart',	'',	'',	'',	'',	NULL,	NULL),
(228,	'church_ministry_leaders_in_place',	'',	'',	'',	'',	NULL,	NULL),
(229,	'evidence_of_adherence_to_statutory_HR_structures. ',	'',	'',	'',	'',	NULL,	NULL),
(230,	'annual_financial_statement  ',	'',	'',	'',	'',	NULL,	NULL),
(231,	'evidence_of_adherence_to_statutory_HR_structures',	'',	'',	'',	'',	NULL,	NULL),
(232,	'availability_of_employees_and_volunteers_for_CY_ministry_in_the_church',	'',	'',	'',	'',	NULL,	NULL),
(233,	'evidence_of_Operational_procedures_&_financial_records',	'',	'',	'',	'',	NULL,	NULL),
(234,	'a_vailability_of_adequate_space',	'',	'',	'',	'',	NULL,	NULL),
(235,	'safe_child_environment',	'',	'',	'',	'',	NULL,	NULL),
(236,	'documented_statement_of_faith_or_constitution',	'',	'',	'',	'',	NULL,	NULL),
(237,	'evidence_of_operational_evangelism_&_discipleship Programs',	'',	'',	'',	'',	NULL,	NULL),
(238,	'evidence_of_church_&_community_mobilization_methodologies',	'',	'',	'',	'',	NULL,	NULL),
(239,	'no_of_learning_activities_church_has_participated_in',	'',	'',	'',	'',	NULL,	NULL),
(240,	'percentage_of_plans_of_action_implemented',	'',	'',	'',	'',	NULL,	NULL),
(241,	'records_review',	'',	'',	'',	'',	NULL,	NULL),
(242,	'evidence_of_holistic_gospel_ministry_in_the_church',	'',	'',	'',	'',	NULL,	NULL),
(243,	'evidence_of_CY_program_activities',	'',	'',	'',	'',	NULL,	NULL),
(244,	'documented_no._of_congregation_sensitization_meetings_held',	'',	'',	'',	'',	NULL,	NULL),
(245,	'church_activity_program',	'',	'',	'',	'',	NULL,	NULL),
(246,	'evidence_of_good_report_about_the_church',	'',	'',	'',	'',	NULL,	NULL),
(247,	'Interview_&_FGDs_with_influencers/_other_stakeholders',	'',	'',	'',	'',	NULL,	NULL),
(248,	'Interview_&_FGDs_with_influencers',	'',	'',	'',	'',	NULL,	NULL),
(249,	'Interviews',	'',	'',	'',	'',	NULL,	NULL),
(250,	'FGDs_with_influencers',	'',	'',	'',	'',	NULL,	NULL),
(251,	'Lead Bio Fields Name',	'',	'',	'',	'',	NULL,	NULL),
(252,	'Datatype Name',	'',	'',	'',	'',	NULL,	NULL),
(253,	'Is Field Unique',	'',	'',	'',	'',	NULL,	NULL),
(254,	'Is Field Null',	'',	'',	'',	'',	NULL,	NULL),
(255,	'Is Suspended',	'',	'',	'',	'',	NULL,	NULL),
(256,	'Lead Test',	'',	'',	'',	'',	NULL,	NULL),
(257,	'select',	'',	'',	'',	'',	NULL,	NULL),
(258,	'add_row',	'',	'',	'',	'',	NULL,	NULL),
(259,	'remove_row',	'',	'',	'',	'',	NULL,	NULL),
(260,	'reset',	'',	'',	'',	'',	NULL,	NULL),
(261,	'Lead Fax No',	'',	'',	'',	'',	NULL,	NULL),
(262,	'Chi Test',	'',	'',	'',	'',	NULL,	NULL),
(263,	'leads_bio_fields',	'',	'',	'',	'',	NULL,	NULL),
(264,	'lead_assessment',	'',	'',	'',	'',	NULL,	NULL),
(265,	'connect_stage',	'',	'',	'',	'',	NULL,	NULL),
(266,	'user',	'',	'',	'',	'',	NULL,	NULL),
(267,	'list',	'',	'',	'',	'',	NULL,	NULL),
(268,	'firstname',	'',	'',	'',	'',	NULL,	NULL),
(269,	'lastname',	'',	'',	'',	'',	NULL,	NULL),
(270,	'email_notify',	'',	'',	'',	'',	NULL,	NULL),
(271,	'password',	'',	'',	'',	'',	NULL,	NULL),
(272,	'gender',	'',	'',	'',	'',	NULL,	NULL),
(273,	'role_id',	'',	'',	'',	'',	NULL,	NULL),
(274,	'profile_id',	'',	'',	'',	'',	NULL,	NULL),
(275,	'auth',	'',	'',	'',	'',	NULL,	NULL),
(276,	'system_admin',	'',	'',	'',	'',	NULL,	NULL),
(277,	'create_by',	'',	'',	'',	'',	NULL,	NULL),
(278,	'last_modified_by',	'',	'',	'',	'',	NULL,	NULL),
(279,	'created_date',	'',	'',	'',	'',	NULL,	NULL),
(280,	'last_modified_date',	'',	'',	'',	'',	NULL,	NULL),
(281,	'view',	'',	'',	'',	'',	NULL,	NULL),
(282,	'edit',	'',	'',	'',	'',	NULL,	NULL),
(283,	'connect_stages',	'',	'',	'',	'',	NULL,	NULL),
(284,	'assessment_progress_measure',	'',	'',	'',	'',	NULL,	NULL),
(285,	'add',	'',	'',	'',	'',	NULL,	NULL),
(286,	'datatype',	'',	'',	'',	'',	NULL,	NULL),
(287,	'field_name',	'',	'',	'',	'',	NULL,	NULL),
(288,	'compassion_stages',	'',	'',	'',	'',	NULL,	NULL),
(289,	'customized_review_status',	'',	'',	'',	'',	NULL,	NULL),
(290,	'suspended',	'',	'',	'',	'',	NULL,	NULL),
(291,	'active',	'',	'',	'',	'',	NULL,	NULL),
(292,	'leads_profile',	'',	'',	'',	'',	NULL,	NULL),
(293,	'leads_bio_information',	'',	'',	'',	'',	NULL,	NULL),
(294,	'assessment',	'',	'',	'',	'',	NULL,	NULL),
(295,	'success',	'',	'',	'',	'',	NULL,	NULL),
(296,	'assess_lead',	'',	'',	'',	'',	NULL,	NULL),
(297,	'Closed',	'',	'',	'',	'',	NULL,	NULL),
(298,	'is_field_required?',	'',	'',	'',	'',	NULL,	NULL),
(299,	'lead',	'',	'',	'',	'',	NULL,	NULL),
(300,	'leads_profile_information',	'',	'',	'',	'',	NULL,	NULL),
(301,	'prepartneship_assessment_form',	'',	'',	'',	'',	NULL,	NULL),
(302,	'submit',	'',	'',	'',	'',	NULL,	NULL),
(303,	'not_scored',	'',	'',	'',	'',	NULL,	NULL),
(304,	'high',	'',	'',	'',	'',	NULL,	NULL),
(305,	'low',	'',	'',	'',	'',	NULL,	NULL),
(306,	'enter_comment_here',	'',	'',	'',	'',	NULL,	NULL),
(307,	'lead_connect_id',	'',	'',	'',	'',	NULL,	NULL),
(308,	'denomination',	'',	'',	'',	'',	NULL,	NULL),
(309,	'congregation_size',	'',	'',	'',	'',	NULL,	NULL),
(310,	'lead_location',	'',	'',	'',	'',	NULL,	NULL),
(311,	'assessment_stage',	'',	'',	'',	'',	NULL,	NULL),
(312,	'last_updated_date',	'',	'',	'',	'',	NULL,	NULL),
(313,	'progress_status',	'',	'',	'',	'',	NULL,	NULL),
(314,	'last_updated_by',	'',	'',	'',	'',	NULL,	NULL);

DROP TABLE IF EXISTS `leads_bio_information`;
CREATE TABLE `leads_bio_information` (
  `leads_bio_information_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_milestones_id` int(3) NOT NULL COMMENT '1=initial assessment',
  `lead_status` varchar(8) NOT NULL DEFAULT 'Active' COMMENT 'Active=lead is live; Closed=Lead converted or closed',
  `lead_connect_id` varchar(100) NOT NULL,
  `lead_name` varchar(100) NOT NULL,
  `lead_phone` int(100) NOT NULL DEFAULT '0',
  `lead_location` varchar(100) DEFAULT NULL,
  `denomination` varchar(100) DEFAULT NULL,
  `gps_location` varchar(100) DEFAULT NULL,
  `congregation_size` int(100) DEFAULT NULL,
  PRIMARY KEY (`leads_bio_information_id`),
  UNIQUE KEY `lead_connect_id` (`lead_connect_id`),
  KEY `assessment_milestones_id` (`assessment_milestones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `leads_bio_information` (`leads_bio_information_id`, `assessment_milestones_id`, `lead_status`, `lead_connect_id`, `lead_name`, `lead_phone`, `lead_location`, `denomination`, `gps_location`, `congregation_size`) VALUES
(16,	25,	'Active',	'L-263546',	'PCEA Baraka',	2147483647,	'Nakuru',	'Presbeterian',	NULL,	218),
(43,	25,	'Active',	'L-97676',	'PEFA Mambrui',	723238734,	'Malindi',	'Pentecostal',	NULL,	160);

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

INSERT INTO `lead_bio_fields` (`lead_bio_fields_id`, `lead_bio_fields_name`, `lead_bio_info_column`, `datatype_id`, `is_field_unique`, `is_field_null`, `default_value`, `show_field`, `is_suspended`) VALUES
(32,	'Lead Connect ID',	'lead_connect_id',	1,	1,	0,	'',	1,	0),
(33,	'Lead Name',	'lead_name',	1,	0,	0,	'',	1,	0),
(34,	'Lead Phone',	'lead_phone',	2,	0,	1,	'0',	0,	0),
(35,	'Lead Location',	'lead_location',	1,	0,	1,	'',	1,	0),
(36,	'Denomination',	'denomination',	1,	0,	1,	'',	1,	0),
(37,	'GPS Location',	'gps_location',	1,	0,	0,	'',	0,	0),
(38,	'Congregation Size',	'congregation_size',	2,	0,	1,	'',	1,	0);

DROP TABLE IF EXISTS `method`;
CREATE TABLE `method` (
  `method_id` int(100) NOT NULL AUTO_INCREMENT,
  `method_name` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT '1',
  PRIMARY KEY (`method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `method` (`method_id`, `method_name`, `status`) VALUES
(1,	'Method 1',	'1'),
(2,	'Method 2',	'1'),
(3,	'Method 3',	'1'),
(4,	'Method 4',	'1');

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

DROP TABLE IF EXISTS `rel_milestone_measure`;
CREATE TABLE `rel_milestone_measure` (
  `rel_milestone_measure_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_milestones_id` int(3) NOT NULL,
  `assessment_progress_measure_id` int(3) NOT NULL,
  PRIMARY KEY (`rel_milestone_measure_id`),
  KEY `assessment_milestones_id` (`assessment_milestones_id`),
  KEY `assessment_progress_measure_id` (`assessment_progress_measure_id`),
  CONSTRAINT `rel_milestone_measure_ibfk_1` FOREIGN KEY (`assessment_milestones_id`) REFERENCES `assessment_milestones` (`assessment_milestones_id`),
  CONSTRAINT `rel_milestone_measure_ibfk_2` FOREIGN KEY (`assessment_progress_measure_id`) REFERENCES `assessment_progress_measure` (`assessment_progress_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `rel_milestone_measure` (`rel_milestone_measure_id`, `assessment_milestones_id`, `assessment_progress_measure_id`) VALUES
(1,	25,	1),
(2,	25,	2),
(3,	25,	3),
(4,	25,	4),
(6,	25,	6),
(7,	25,	7),
(8,	25,	8),
(9,	25,	9),
(10,	25,	10),
(11,	26,	1),
(12,	26,	2),
(13,	26,	3),
(14,	26,	4),
(15,	26,	5),
(16,	26,	6),
(17,	26,	7),
(18,	26,	8),
(19,	26,	9),
(20,	26,	10),
(26,	27,	1),
(27,	27,	2),
(28,	27,	3),
(29,	27,	4),
(30,	27,	5),
(31,	27,	6),
(32,	27,	7),
(33,	27,	8),
(34,	27,	9),
(35,	27,	10),
(41,	28,	1),
(42,	28,	2),
(43,	28,	3),
(44,	28,	4),
(45,	28,	5),
(46,	28,	6),
(47,	28,	7),
(48,	28,	8),
(49,	28,	9),
(50,	28,	10),
(56,	29,	1),
(57,	29,	2),
(58,	29,	3),
(59,	29,	4),
(60,	29,	5),
(61,	29,	6),
(62,	29,	7),
(63,	29,	8),
(64,	29,	9),
(65,	29,	10);

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

DROP TABLE IF EXISTS `test_default_field`;
CREATE TABLE `test_default_field` (
  `test_default_field_id` int(100) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`test_default_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
(1,	'Nicodemus',	'Karisa',	'NKarisa@ke.ci.org',	1,	'fbdf9989ea636d6b339fd6b85f63e06e',	'Male',	'0723305687',	1,	1,	1,	0,	1,	1,	'2019-04-30',	'2020-01-23 09:22:23');

DROP TABLE IF EXISTS `verification_tool`;
CREATE TABLE `verification_tool` (
  `verification_tool_id` int(100) NOT NULL AUTO_INCREMENT,
  `verification_tool_name` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT '1',
  PRIMARY KEY (`verification_tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `verification_tool` (`verification_tool_id`, `verification_tool_name`, `status`) VALUES
(1,	'Tool 1',	'1'),
(2,	'Tool 2',	'0'),
(3,	'Tool 3',	'1'),
(4,	'Tool 4',	'1');

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

-- 2020-01-23 21:14:04