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

CREATE TABLE `assessment` (
  `assessment_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_milestone_id` int(3) NOT NULL,
  `leads_bio_information_id` int(100) NOT NULL,
  PRIMARY KEY (`assessment_id`),
  KEY `assessment_milestones_id` (`assessment_milestone_id`),
  CONSTRAINT `assessment_ibfk_1` FOREIGN KEY (`assessment_milestone_id`) REFERENCES `assessment_milestone` (`assessment_milestone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment` (`assessment_id`, `assessment_milestone_id`, `leads_bio_information_id`) VALUES
(1,	1,	1);

CREATE TABLE `assessment_milestone` (
  `assessment_milestone_id` int(3) NOT NULL AUTO_INCREMENT,
  `assessment_milestone_name` varchar(20) NOT NULL,
  `insert_after` int(5) NOT NULL,
  `assessment_period_in_days` int(5) NOT NULL,
  `assessment_review_status` varchar(50) NOT NULL,
  `user_customized_review_status` varchar(50) NOT NULL,
  PRIMARY KEY (`assessment_milestone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_milestone` (`assessment_milestone_id`, `assessment_milestone_name`, `insert_after`, `assessment_period_in_days`, `assessment_review_status`, `user_customized_review_status`) VALUES
(1,	'Initial Assessment',	0,	10,	'Ready for Initial Assessment',	'Ready for Initial Assessment	');

CREATE TABLE `assessment_progress_measure` (
  `assessment_progress_measure_id` int(3) NOT NULL AUTO_INCREMENT,
  `assessment_progress_measure_name` varchar(100) NOT NULL,
  `verification_tool` longtext NOT NULL,
  `weight` int(3) NOT NULL,
  `assessment_method` longtext NOT NULL,
  `connect_progress_measure_id` int(3) NOT NULL,
  PRIMARY KEY (`assessment_progress_measure_id`),
  KEY `connect_progress_measure_id` (`connect_progress_measure_id`),
  CONSTRAINT `assessment_progress_measure_ibfk_1` FOREIGN KEY (`connect_progress_measure_id`) REFERENCES `connect_progress_measure` (`connect_progress_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_progress_measure` (`assessment_progress_measure_id`, `assessment_progress_measure_name`, `verification_tool`, `weight`, `assessment_method`, `connect_progress_measure_id`) VALUES
(6,	'T6',	'X6',	10,	'Y6',	6),
(7,	'T2',	'X2',	2,	'Y2',	2),
(8,	'T3',	'X3',	3,	'Y3',	3),
(9,	'T10',	'X9',	9,	'Y8',	6),
(10,	'T5',	'X5',	5,	'Y5',	6);

CREATE TABLE `assessment_score` (
  `assessment_score` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(100) NOT NULL,
  `assessment_progress_measure_id` int(3) NOT NULL,
  PRIMARY KEY (`assessment_score`),
  KEY `assessment_id` (`assessment_id`),
  KEY `assessment_progress_measure_id` (`assessment_progress_measure_id`),
  CONSTRAINT `assessment_score_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessment` (`assessment_id`),
  CONSTRAINT `assessment_score_ibfk_2` FOREIGN KEY (`assessment_progress_measure_id`) REFERENCES `assessment_progress_measure` (`assessment_progress_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0kjrv9364kldbeg66tqj7jr7hutpnig4',	'::1',	1560110029,	'__ci_last_regenerate|i:1560109838;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('10b600jjn122g8vqrdqfnbhv3b8atni3',	'::1',	1560013558,	'__ci_last_regenerate|i:1560013558;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('16pa0252dtqp8umhgttqf0so83q7tcl5',	'::1',	1559652981,	'__ci_last_regenerate|i:1559652981;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('1b8m8aatt0s3g4akb43kig1glqses5sb',	'::1',	1559592322,	'__ci_last_regenerate|i:1559592322;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('1ro2eon42fdi07asdv95i31e60mrkmp9',	'::1',	1559648994,	'__ci_last_regenerate|i:1559648994;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('1voj6e43ht4dg26p685licfmhcelr4f6',	'::1',	1559648018,	'__ci_last_regenerate|i:1559648018;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('25tpeh1gvf9j8s34fv2f946u458gb61v',	'::1',	1560109838,	'__ci_last_regenerate|i:1560109838;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('26sve4rg2ise2cjfmjq9tig0f6aqpkjd',	'::1',	1559915585,	'__ci_last_regenerate|i:1559915585;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('2bgbm75s8gmd2k1s8e4nc2ncg2a12m1l',	'::1',	1559640495,	'__ci_last_regenerate|i:1559640495;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('325uf8fft1dterd3ldume3mv75473m1g',	'::1',	1559585179,	'__ci_last_regenerate|i:1559585179;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('4411aupu9v78jsiu2s2po16418dih4h4',	'::1',	1560113113,	'__ci_last_regenerate|i:1560113113;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('4l57o6quh4ak185boqds346va1ar7303',	'::1',	1560011701,	'__ci_last_regenerate|i:1560011701;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('4tl899nrmrmi91hgabhji59getooqtnr',	'::1',	1560113574,	'__ci_last_regenerate|i:1560113574;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('53j81rdt1igd2n0qukv1ao54b8fluamc',	'::1',	1559591701,	'__ci_last_regenerate|i:1559591701;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('55n0o216a1c7f9feb5ank79h7ehk96qb',	'::1',	1559652674,	'__ci_last_regenerate|i:1559652674;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('565oob12p6np4ev64vdpf47op6cr6cap',	'::1',	1559656998,	'__ci_last_regenerate|i:1559656998;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('5tkarfusmdiipeltvikls4745m7ptcsu',	'::1',	1560011331,	'__ci_last_regenerate|i:1560011331;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('5uqtl6vmf6iouecgg1ad5lp4gmr7779d',	'::1',	1559644354,	'__ci_last_regenerate|i:1559644354;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('5vtmrcg7n2d73ev2nsihf0lg9silrrnu',	'::1',	1560057897,	'__ci_last_regenerate|i:1560057886;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('651sa36apv53ooi8ahjoefgjfbsr59es',	'::1',	1559583451,	'__ci_last_regenerate|i:1559583451;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('6g1dfrln029dv7e8kcvhljftdbqru0bv',	'::1',	1559658204,	'__ci_last_regenerate|i:1559658203;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('6sl9d0d90oensdq73u5t2ocdndqr4qe3',	'::1',	1559654268,	'__ci_last_regenerate|i:1559654268;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('6vngmo10ovv5j01d5khidq3slfmlps66',	'::1',	1560111151,	'__ci_last_regenerate|i:1560111151;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('7fdob8flit63r0odeutbqtac2avpknsp',	'::1',	1560107870,	'__ci_last_regenerate|i:1560107870;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('7i2af8deb6p7ip1noa2jdiroj0l72phk',	'::1',	1559651914,	'__ci_last_regenerate|i:1559651914;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('7k82q0t42l9c7uf1off13gno78aa5rv0',	'::1',	1559656251,	'__ci_last_regenerate|i:1559656251;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('7okv0i89j04gljoqb8ft99aoo2ktine6',	'::1',	1559639781,	'__ci_last_regenerate|i:1559639781;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('7u2m0utl1dn5j3hdatpg7oe4nuvohba5',	'::1',	1559638937,	'__ci_last_regenerate|i:1559638937;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('7uamhc49p3af4jmkbrovaf7q1m4c82lh',	'::1',	1559590421,	'__ci_last_regenerate|i:1559590421;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('8dbs31sakcoeeedqadocpj02t2d0fm08',	'::1',	1559649328,	'__ci_last_regenerate|i:1559649328;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('8j0eh473pn7gtko7ubcmtspula2ccskd',	'::1',	1559656694,	'__ci_last_regenerate|i:1559656694;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('95ubjmniq2v5iql9vufm5304tvll2cd5',	'::1',	1559588348,	'__ci_last_regenerate|i:1559588348;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('9nibjtpjegnj7q720lpl82mso7q0h9js',	'::1',	1559582344,	'__ci_last_regenerate|i:1559582344;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('9v3vfc9746jmhbnr3v9d7k9jasehjblf',	'::1',	1559584643,	'__ci_last_regenerate|i:1559584643;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('a1jkhep5qc77ettu3d4k1iukpd7i1drj',	'::1',	1559654761,	'__ci_last_regenerate|i:1559654761;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('apphuail56cabkkv0rgnb9v2kijjme8b',	'::1',	1559650303,	'__ci_last_regenerate|i:1559650303;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('aq3454smg02bsr2neproo0g03ltrcv0k',	'::1',	1560113968,	'__ci_last_regenerate|i:1560113968;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('bm66qv69390a2kjpqejbde71ceaks2f6',	'::1',	1559652258,	'__ci_last_regenerate|i:1559652258;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('brcgcvpg8q8alrfb6t6b4ekqublndvr9',	'::1',	1559916130,	'__ci_last_regenerate|i:1559915985;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('bs8icuknhb1sclrfqlvvc58dd5dsj2qb',	'::1',	1559637899,	'__ci_last_regenerate|i:1559637899;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('c1h95to4lev7l76v0jbbvi11qmvhdqs8',	'::1',	1559580443,	'__ci_last_regenerate|i:1559580443;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('c3tmp09k9chpu5lg7hpu13h34n3qgg3k',	'::1',	1560115063,	'__ci_last_regenerate|i:1560115063;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('c4k5bnl5ru27o5rk4u73jtg4p7k2g8hg',	'::1',	1559592678,	'__ci_last_regenerate|i:1559592678;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('cpa9dpiu0chvk73hn38c08ua1divtd5n',	'::1',	1559592016,	'__ci_last_regenerate|i:1559592016;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('cuq92hs6dima95i70opi0ndfcddds099',	'::1',	1560112438,	'__ci_last_regenerate|i:1560112438;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('d40n7e2qqkf3ekb35bjo9gu8n9clg0op',	'::1',	1559581107,	'__ci_last_regenerate|i:1559581107;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('d5id918ulnd4hk1hjelomehlkn7ob1a8',	'::1',	1560164740,	'__ci_last_regenerate|i:1560164715;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('d84tr0d7nti5jna0e5al88glmd9u1ftd',	'::1',	1559644696,	'__ci_last_regenerate|i:1559644696;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('ejql7fuivkp2l25q0dl0jns4jo95iodj',	'::1',	1559996989,	'__ci_last_regenerate|i:1559996989;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('enu3o27pq9jmjf459jparjhk0547fi0h',	'::1',	1559640826,	'__ci_last_regenerate|i:1559640826;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('f104pcthnuu8vj220jor5ribqbcv9sd9',	'::1',	1559591168,	'__ci_last_regenerate|i:1559591168;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('f3pla3encpt8kpt4nlq5m7h4ncli56n8',	'::1',	1559590827,	'__ci_last_regenerate|i:1559590827;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('g87be2jnkmnkip5q4bac3ff4utn74022',	'::1',	1559653960,	'__ci_last_regenerate|i:1559653960;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('g9cn4vnie9n969rpvd4quh10a8ntlh12',	'::1',	1559915985,	'__ci_last_regenerate|i:1559915985;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('ge6nktdgo5hucvctkv6pl0p7pu9iacmi',	'::1',	1560114293,	'__ci_last_regenerate|i:1560114293;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('h4hvl3cjhn4hl40ebujc7d4a0bfvth9q',	'::1',	1560112789,	'__ci_last_regenerate|i:1560112789;view_type|s:9:\"dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('h5l1rjnc92d3flvoi9p72q6a4goih6j8',	'::1',	1560109476,	'__ci_last_regenerate|i:1560109476;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('hc5u03p3d39irt7v92irkvbvig8o3vfm',	'::1',	1559594109,	'__ci_last_regenerate|i:1559594109;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('hr2qlhg4nkgu0k6ikqcf43t3ojdvjo9d',	'::1',	1559585513,	'__ci_last_regenerate|i:1559585513;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('hv3ss3g23bmquc9pnuv0npiur15ao8q2',	'::1',	1559653624,	'__ci_last_regenerate|i:1559653624;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('i2al5mj2csla192ou1b6jvpgus02a7pa',	'::1',	1559653307,	'__ci_last_regenerate|i:1559653307;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('i7g6n3ujq2qpj0fk875m1t5694g6vkn4',	'::1',	1560013826,	'__ci_last_regenerate|i:1560013558;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('il209t0tthbotodgajpc6l6sh46c4oom',	'::1',	1559996993,	'__ci_last_regenerate|i:1559996989;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"dashboard\";'),
('ircljtort59r6dg1p7gg300mrep4su6o',	'::1',	1559996351,	'__ci_last_regenerate|i:1559996351;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('ivn6sa4d6oe1olg9e43ockvvjvip3q07',	'::1',	1559589851,	'__ci_last_regenerate|i:1559589851;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('j0updgjltnglpb9nb1to3mmavbflt451',	'::1',	1559583871,	'__ci_last_regenerate|i:1559583871;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('jkd8mve6uh2r96cogr4sg9oi9gkkpomv',	'::1',	1560114757,	'__ci_last_regenerate|i:1560114757;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('jqo97dlue507l4nqouql3j2ceje0ck8j',	'::1',	1559657871,	'__ci_last_regenerate|i:1559657871;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('jssq57nld6ekne1996hgg9crtvpl6jq4',	'::1',	1559651531,	'__ci_last_regenerate|i:1559651531;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('jt52d64ov5erc58vqn96jt5t2nge6sbr',	'::1',	1559635314,	'__ci_last_regenerate|i:1559635314;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('k5h4bn8bv7endvdqdqd2p2r9r7l7996q',	'::1',	1559588876,	'__ci_last_regenerate|i:1559588876;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('k89qa5991t5aq7ue7qalro3f93ghbao2',	'::1',	1559594110,	'__ci_last_regenerate|i:1559594110;'),
('l7gcisd1n47gp53ufs4jjoadeessdttr',	'::1',	1560111691,	'__ci_last_regenerate|i:1560111691;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('l7m6sb8u6ipphoo3m1eoh6sj59nc115n',	'::1',	1559586375,	'__ci_last_regenerate|i:1559586375;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('l7vuu9m3ai2id7mbs19js8ut6ml8l8d1',	'::1',	1560115383,	'__ci_last_regenerate|i:1560115382;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('leqiaerjkl8qm0chh1k1tdgueuhchcu4',	'::1',	1560108550,	'__ci_last_regenerate|i:1560108550;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('loqbeq6f7ld3g2a8f1e86gqh49hv5vnj',	'::1',	1559639348,	'__ci_last_regenerate|i:1559639348;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('lslmc5nvo3d8fcfgdgpl4ubamta60en7',	'::1',	1560108945,	'__ci_last_regenerate|i:1560108945;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('michhjuq5ug1v2lh8vpcfu4dl6nom10s',	'::1',	1559996682,	'__ci_last_regenerate|i:1559996682;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('n5595i3p5k64afn0c5j3dc3pns5c2us7',	'::1',	1559582664,	'__ci_last_regenerate|i:1559582664;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('ndsqhmv63ningjcbfel02qeota6929kb',	'::1',	1559641231,	'__ci_last_regenerate|i:1559641231;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('nnd9lutuo2ssopevh91ldcv7vl07jars',	'::1',	1559657405,	'__ci_last_regenerate|i:1559657405;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('ntld9lja3bs6t1ae2t3moje0uvphqiiv',	'::1',	1559638376,	'__ci_last_regenerate|i:1559638376;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('oau9bj4k8snkg80l0hbka13rnvome2bc',	'::1',	1560115382,	'__ci_last_regenerate|i:1560115382;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('oj7nj3viiuqnpoq79nq975k3hj57f88j',	'::1',	1560110489,	'__ci_last_regenerate|i:1560110489;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('oqvukmo902ibeofpi0l1dq7mkc29hkjl',	'::1',	1559581920,	'__ci_last_regenerate|i:1559581920;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('pa26d58mtik2gj5o5gk9mrkdibj0s9au',	'::1',	1560111692,	'__ci_last_regenerate|i:1560111691;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('ph5jumlqoepai6gcifa7pbbv15pn9tpj',	'::1',	1560108174,	'__ci_last_regenerate|i:1560108174;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('pm9s8s7r3hd9q9cnmum7eq6qjuidjvn1',	'::1',	1559650622,	'__ci_last_regenerate|i:1559650622;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('pmhn3rrutfjajs060ilnc0rkgpgs8880',	'::1',	1559649647,	'__ci_last_regenerate|i:1559649647;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('pp04ob43jmhl8tif65gos3ct4oifffj2',	'::1',	1559589499,	'__ci_last_regenerate|i:1559589499;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('q0vk7ijfti8imghme9vopcakf9aibdv7',	'::1',	1559650923,	'__ci_last_regenerate|i:1559650923;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('q221jl0ndcustgajpk3lnviuiugd8pbu',	'::1',	1559648689,	'__ci_last_regenerate|i:1559648689;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('qrdl6i8eao3j5i85dhadf83k6tltv0v0',	'::1',	1560111152,	'__ci_last_regenerate|i:1560111151;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('r9dkka6tmfr36gghobunebfrkn8trgsf',	'::1',	1559649976,	'__ci_last_regenerate|i:1559649976;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('rivau60c8l14vvc54j0stobf0s5nfc3q',	'::1',	1559581483,	'__ci_last_regenerate|i:1559581483;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('s1pvmm0l2insvtf92v6ud3b81dio8o87',	'::1',	1559583071,	'__ci_last_regenerate|i:1559583071;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('s314vmbnvguqa89vabob8uvg59u623qa',	'::1',	1559579607,	'__ci_last_regenerate|i:1559579607;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('s740ovattjlnddrd3ahmdjhef6dtjq26',	'::1',	1560110833,	'__ci_last_regenerate|i:1560110833;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('soodo3jpmk74bv09bhb2rc50o3pleb70',	'::1',	1559658203,	'__ci_last_regenerate|i:1559658203;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('sr113i26kole8t90p3800j7a66uoq5it',	'::1',	1559640164,	'__ci_last_regenerate|i:1559640164;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('t5sm49kitu8foho83pg1dc7t679lakb2',	'::1',	1559584173,	'__ci_last_regenerate|i:1559584173;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('t7bmght6tu1s1mutn8b6a1k0i38bj4ov',	'::1',	1559580801,	'__ci_last_regenerate|i:1559580801;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('t8kqlh7sk3n0ge2blc1h72vjotsnbhbs',	'::1',	1559585828,	'__ci_last_regenerate|i:1559585828;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('uqe0gm21tj8oo0na5n7ag3eav9ql9g1j',	'::1',	1559592984,	'__ci_last_regenerate|i:1559592984;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('uqusa0mnmvd0dvu6f0eug9hfdga35kvg',	'::1',	1559655517,	'__ci_last_regenerate|i:1559655517;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('ut30kdg77avdh1dkb8pv7ql0vgj705gr',	'::1',	1559995841,	'__ci_last_regenerate|i:1559995841;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";');

CREATE TABLE `connect_progress_measure` (
  `connect_progress_measure_id` int(3) NOT NULL AUTO_INCREMENT,
  `connect_progress_measure_name` varchar(50) NOT NULL,
  `connect_stage_id` int(10) NOT NULL,
  PRIMARY KEY (`connect_progress_measure_id`),
  KEY `connect_stage_id` (`connect_stage_id`),
  CONSTRAINT `connect_progress_measure_ibfk_1` FOREIGN KEY (`connect_stage_id`) REFERENCES `connect_stage` (`connect_stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `connect_progress_measure` (`connect_progress_measure_id`, `connect_progress_measure_name`, `connect_stage_id`) VALUES
(1,	'Test',	1),
(2,	'Test 0',	2),
(3,	'Test 2',	1),
(4,	'T1',	1),
(5,	'T2',	2),
(6,	'T3',	2),
(7,	'Testing score',	1);

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
  `sql_datatype` varchar(20) NOT NULL,
  PRIMARY KEY (`datatype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `datatype` (`datatype_id`, `datatype_name`, `sql_datatype`) VALUES
(1,	'text',	'varchar'),
(2,	'number',	'int');

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
(355,	'comment',	'',	'',	'',	'',	NULL,	NULL),
(354,	'score',	'',	'',	'',	'',	NULL,	NULL),
(353,	'method_of_assessment',	'',	'',	'',	'',	NULL,	NULL),
(352,	'verication_tools',	'',	'',	'',	'',	NULL,	NULL),
(351,	'progress_measure',	'',	'',	'',	'',	NULL,	NULL),
(344,	'Leads Bio Information Id',	'',	'',	'',	'',	NULL,	NULL),
(327,	'Connect Lead Id',	'',	'',	'',	'',	NULL,	NULL),
(326,	'When',	'',	'',	'',	'',	NULL,	NULL),
(325,	'lead_bio_information',	'',	'',	'',	'',	NULL,	NULL),
(324,	'lead_name',	'',	'',	'',	'',	NULL,	NULL),
(323,	'lead_connect_id',	'',	'',	'',	'',	NULL,	NULL),
(322,	'Email',	'',	'',	'',	'',	NULL,	NULL),
(321,	'Location',	'',	'',	'',	'',	NULL,	NULL),
(320,	'Lead Name',	'',	'',	'',	'',	NULL,	NULL),
(319,	'Lead Connect Id',	'',	'',	'',	'',	NULL,	NULL),
(318,	'is_suspended',	'',	'',	'',	'',	NULL,	NULL),
(317,	'show_field',	'',	'',	'',	'',	NULL,	NULL),
(316,	'default_value',	'',	'',	'',	'',	NULL,	NULL),
(315,	'is_field_null',	'',	'',	'',	'',	NULL,	NULL),
(314,	'is_field_unique',	'',	'',	'',	'',	NULL,	NULL),
(313,	'datatype_id',	'',	'',	'',	'',	NULL,	NULL),
(312,	'lead_bio_fields_name',	'',	'',	'',	'',	NULL,	NULL),
(311,	'reset',	'',	'',	'',	'',	NULL,	NULL),
(310,	'remove_row',	'',	'',	'',	'',	NULL,	NULL),
(309,	'add_row',	'',	'',	'',	'',	NULL,	NULL),
(308,	'user_customized_review_status',	'',	'',	'',	'',	NULL,	NULL),
(307,	'assessment_period_in_days',	'',	'',	'',	'',	NULL,	NULL),
(306,	'select',	'',	'',	'',	'',	NULL,	NULL),
(305,	'insert_after',	'',	'',	'',	'',	NULL,	NULL),
(304,	'milestone_name',	'',	'',	'',	'',	NULL,	NULL),
(303,	'User Customized Review Status',	'',	'',	'',	'',	NULL,	NULL),
(302,	'Assessment Period In Days',	'',	'',	'',	'',	NULL,	NULL),
(301,	'Insert After',	'',	'',	'',	'',	NULL,	NULL),
(300,	'Milestone Name',	'',	'',	'',	'',	NULL,	NULL),
(299,	'forgot_your_password',	'',	'',	'',	'',	NULL,	NULL),
(298,	'login',	'',	'',	'',	'',	NULL,	NULL),
(297,	'leads_information',	'',	'',	'',	'',	NULL,	NULL),
(296,	'Assessment Id',	'',	'',	'',	'',	NULL,	NULL),
(295,	'Lead Status',	'',	'',	'',	'',	NULL,	NULL),
(294,	'initial_assessment',	'',	'',	'',	'',	NULL,	NULL),
(293,	'update_phrase',	'',	'',	'',	'',	NULL,	NULL),
(292,	'value_required',	'',	'',	'',	'',	NULL,	NULL),
(291,	'phrase',	'',	'',	'',	'',	NULL,	NULL),
(290,	'delete_language',	'',	'',	'',	'',	NULL,	NULL),
(289,	'edit_phrase',	'',	'',	'',	'',	NULL,	NULL),
(288,	'option',	'',	'',	'',	'',	NULL,	NULL),
(287,	'add_language',	'',	'',	'',	'',	NULL,	NULL),
(286,	'add_phrase',	'',	'',	'',	'',	NULL,	NULL),
(285,	'language_list',	'',	'',	'',	'',	NULL,	NULL),
(284,	'manage_language',	'',	'',	'',	'',	NULL,	NULL),
(283,	'upload',	'',	'',	'',	'',	NULL,	NULL),
(282,	'photo',	'',	'',	'',	'',	NULL,	NULL),
(281,	'upload_logo',	'',	'',	'',	'',	NULL,	NULL),
(280,	'select_a_theme_to_make_changes',	'',	'',	'',	'',	NULL,	NULL),
(279,	'select_theme',	'',	'',	'',	'',	NULL,	NULL),
(278,	'default',	'',	'',	'',	'',	NULL,	NULL),
(277,	'theme_settings',	'',	'',	'',	'',	NULL,	NULL),
(276,	'install_update',	'',	'',	'',	'',	NULL,	NULL),
(275,	'file',	'',	'',	'',	'',	NULL,	NULL),
(274,	'update_product',	'',	'',	'',	'',	NULL,	NULL),
(273,	'save',	'',	'',	'',	'',	NULL,	NULL),
(272,	'no',	'',	'',	'',	'',	NULL,	NULL),
(271,	'yes',	'',	'',	'',	'',	NULL,	NULL),
(270,	'sidebar_collapsed',	'',	'',	'',	'',	NULL,	NULL),
(269,	'text_align',	'',	'',	'',	'',	NULL,	NULL),
(268,	'system_email',	'',	'',	'',	'',	NULL,	NULL),
(267,	'phone',	'',	'',	'',	'',	NULL,	NULL),
(266,	'address',	'',	'',	'',	'',	NULL,	NULL),
(265,	'system_title',	'',	'',	'',	'',	NULL,	NULL),
(264,	'system_name',	'',	'',	'',	'',	NULL,	NULL),
(263,	'system_settings',	'',	'',	'',	'',	NULL,	NULL),
(262,	'Ok',	'',	'',	'',	'',	NULL,	NULL),
(261,	'cancel',	'',	'',	'',	'',	NULL,	NULL),
(260,	'delete',	'',	'',	'',	'',	NULL,	NULL),
(259,	'please_wait_until_you_receive_confirmation',	'',	'',	'',	'',	NULL,	NULL),
(258,	'process_aborted',	'',	'',	'',	'',	NULL,	NULL),
(257,	'Are_you_sure_you_want_to_perform_this_action?',	'',	'',	'',	'',	NULL,	NULL),
(256,	'forward',	'',	'',	'',	'',	NULL,	NULL),
(255,	'log_out',	'',	'',	'',	'',	NULL,	NULL),
(254,	'language',	'',	'',	'',	'',	NULL,	NULL),
(253,	'edit_profile',	'',	'',	'',	'',	NULL,	NULL),
(252,	'change_password',	'',	'',	'',	'',	NULL,	NULL),
(251,	'account',	'',	'',	'',	'',	NULL,	NULL),
(250,	'user_profiles',	'',	'',	'',	'',	NULL,	NULL),
(249,	'assessment_progress_measures',	'',	'',	'',	'',	NULL,	NULL),
(248,	'connect_progress_measures',	'',	'',	'',	'',	NULL,	NULL),
(247,	'assessment_milestones',	'',	'',	'',	'',	NULL,	NULL),
(246,	'lead_bio_fields',	'',	'',	'',	'',	NULL,	NULL),
(245,	'language_settings',	'',	'',	'',	'',	NULL,	NULL),
(244,	'sms_settings',	'',	'',	'',	'',	NULL,	NULL),
(243,	'general_settings',	'',	'',	'',	'',	NULL,	NULL),
(242,	'settings',	'',	'',	'',	'',	NULL,	NULL),
(241,	'closed_leads',	'',	'',	'',	'',	NULL,	NULL),
(240,	'active_leads',	'',	'',	'',	'',	NULL,	NULL),
(239,	'leads',	'',	'',	'',	'',	NULL,	NULL),
(238,	'dashboard',	'',	'',	'',	'',	NULL,	NULL),
(237,	'assessment_settings',	'',	'',	'',	'',	NULL,	NULL),
(236,	'Is Suspended',	'',	'Is Field In Use?',	'',	'',	NULL,	NULL),
(235,	'Show Field',	'',	'',	'',	'',	NULL,	NULL),
(234,	'Default Value',	'',	'',	'',	'',	NULL,	NULL),
(233,	'Is Field Null',	'',	'',	'',	'',	NULL,	NULL),
(232,	'Is Field Unique',	'',	'',	'',	'',	NULL,	NULL),
(231,	'Datatype Name',	'',	'',	'',	'',	NULL,	NULL),
(230,	'Lead Bio Fields Name',	'',	'',	'',	'',	NULL,	NULL),
(229,	'action',	'',	'',	'',	'',	NULL,	NULL),
(228,	'back',	'',	'',	'',	'',	NULL,	NULL),
(227,	'add_new_record',	'',	'',	'',	'',	NULL,	NULL),
(335,	'Assessment Milestones Id',	'',	'',	'',	'',	NULL,	NULL),
(334,	'Leads Bio Information.email',	'',	'',	'',	'',	NULL,	NULL),
(345,	'Assessment.assessment Id',	'',	'',	'',	'',	NULL,	NULL),
(346,	'Leads Bio Information.leads Bio Information Id',	'',	'',	'',	'',	NULL,	NULL),
(347,	'Assessment Milestones.milestone Name',	'',	'',	'',	'',	NULL,	NULL),
(348,	'Assessment.leads Bio Information Id',	'',	'',	'',	'',	NULL,	NULL),
(349,	'assessment Review Status',	'',	'',	'',	'',	NULL,	NULL),
(350,	'sql Datatype',	'',	'',	'',	'',	NULL,	NULL),
(356,	'functional_strategic_document',	'',	'',	'',	'',	NULL,	NULL),
(357,	'records-review',	'',	'',	'',	'',	NULL,	NULL),
(358,	'focused_discussions',	'',	'',	'',	'',	NULL,	NULL),
(359,	'documented_selection_process_for_ministry_leaders',	'',	'',	'',	'',	NULL,	NULL),
(360,	'church_organizational_chart',	'',	'',	'',	'',	NULL,	NULL),
(361,	'evidence_of_adherence_to_statutory_HR_structures',	'',	'',	'',	'',	NULL,	NULL),
(362,	'annual_financial_statement  ',	'',	'',	'',	'',	NULL,	NULL),
(363,	'availability_of_employees_and_volunteers_for_CY_ministry_in_the_church',	'',	'',	'',	'',	NULL,	NULL),
(364,	'evidence_of_Operational_procedures_&_financial_records',	'',	'',	'',	'',	NULL,	NULL),
(365,	'a_vailability_of_adequate_space',	'',	'',	'',	'',	NULL,	NULL),
(366,	'safe_child_environment',	'',	'',	'',	'',	NULL,	NULL),
(367,	'observation',	'',	'',	'',	'',	NULL,	NULL),
(368,	'documented_statement_of_faith_or_constitution',	'',	'',	'',	'',	NULL,	NULL),
(369,	'evidence_of_operational_evangelism_&_discipleship Programs',	'',	'',	'',	'',	NULL,	NULL),
(370,	'evidence_of_church_&_community_mobilization_methodologies',	'',	'',	'',	'',	NULL,	NULL),
(371,	'no_of_learning_activities_church_has_participated_in',	'',	'',	'',	'',	NULL,	NULL),
(372,	'percentage_of_plans_of_action_implemented',	'',	'',	'',	'',	NULL,	NULL),
(373,	'records_review',	'',	'',	'',	'',	NULL,	NULL),
(374,	'evidence_of_holistic_gospel_ministry_in_the_church',	'',	'',	'',	'',	NULL,	NULL),
(375,	'evidence_of_CY_program_activities',	'',	'',	'',	'',	NULL,	NULL),
(376,	'documented_no._of_congregation_sensitization_meetings_held',	'',	'',	'',	'',	NULL,	NULL),
(377,	'church_activity_program',	'',	'',	'',	'',	NULL,	NULL),
(378,	'evidence_of_good_report_about_the_church',	'',	'',	'',	'',	NULL,	NULL),
(379,	'Interviews',	'',	'',	'',	'',	NULL,	NULL),
(380,	'FGDs_with_influencers',	'',	'',	'',	'',	NULL,	NULL),
(381,	'general comment',	'',	'',	'',	'',	NULL,	NULL),
(382,	'leads_bio_fields',	'',	'',	'',	'',	NULL,	NULL),
(383,	'user',	'',	'',	'',	'',	NULL,	NULL),
(384,	'list',	'',	'',	'',	'',	NULL,	NULL),
(385,	'firstname',	'',	'',	'',	'',	NULL,	NULL),
(386,	'lastname',	'',	'',	'',	'',	NULL,	NULL),
(387,	'email_notify',	'',	'',	'',	'',	NULL,	NULL),
(388,	'password',	'',	'',	'',	'',	NULL,	NULL),
(389,	'gender',	'',	'',	'',	'',	NULL,	NULL),
(390,	'role_id',	'',	'',	'',	'',	NULL,	NULL),
(391,	'profile_id',	'',	'',	'',	'',	NULL,	NULL),
(392,	'auth',	'',	'',	'',	'',	NULL,	NULL),
(393,	'system_admin',	'',	'',	'',	'',	NULL,	NULL),
(394,	'create_by',	'',	'',	'',	'',	NULL,	NULL),
(395,	'last_modified_by',	'',	'',	'',	'',	NULL,	NULL),
(396,	'created_date',	'',	'',	'',	'',	NULL,	NULL),
(397,	'last_modified_date',	'',	'',	'',	'',	NULL,	NULL),
(398,	'view',	'',	'',	'',	'',	NULL,	NULL),
(399,	'edit',	'',	'',	'',	'',	NULL,	NULL),
(400,	'leads_bio_field',	'',	'',	'',	'',	NULL,	NULL),
(401,	'leads_bio_field_name',	'',	'',	'',	'',	NULL,	NULL),
(402,	'leads_bio_information_column',	'',	'',	'',	'',	NULL,	NULL),
(403,	'datatype_name',	'',	'',	'',	'',	NULL,	NULL),
(404,	'sql_datatype',	'',	'',	'',	'',	NULL,	NULL),
(405,	'add',	'',	'',	'',	'',	NULL,	NULL);

CREATE TABLE `leads_bio_field` (
  `leads_bio_field_id` int(100) NOT NULL AUTO_INCREMENT,
  `leads_bio_field_name` varchar(100) NOT NULL,
  `leads_bio_information_column` varchar(100) NOT NULL,
  `datatype_id` int(100) NOT NULL,
  `is_field_unique` int(5) NOT NULL DEFAULT '1',
  `is_field_null` int(5) NOT NULL DEFAULT '0',
  `default_value` varchar(20) NOT NULL,
  `show_field` int(5) NOT NULL DEFAULT '1' COMMENT '1= Show on summary and lead information listing,0 = Don''t show on summary and lead information listing',
  `is_suspended` int(5) NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  PRIMARY KEY (`leads_bio_field_id`),
  KEY `datatype_id` (`datatype_id`),
  CONSTRAINT `leads_bio_field_ibfk_1` FOREIGN KEY (`datatype_id`) REFERENCES `datatype` (`datatype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `leads_bio_field` (`leads_bio_field_id`, `leads_bio_field_name`, `leads_bio_information_column`, `datatype_id`, `is_field_unique`, `is_field_null`, `default_value`, `show_field`, `is_suspended`) VALUES
(2,	'Lead Name',	'lead_name',	1,	0,	0,	'',	0,	0),
(3,	'Location',	'location',	1,	0,	0,	'',	1,	0),
(4,	'Phone',	'phone',	2,	1,	0,	'',	1,	0),
(5,	'Email',	'email',	1,	1,	0,	'',	1,	0);

CREATE TABLE `leads_bio_information` (
  `leads_bio_information_id` int(100) NOT NULL AUTO_INCREMENT,
  `lead_status` varchar(30) DEFAULT NULL,
  `connect_lead_id` varchar(20) DEFAULT NULL,
  `lead_name` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `phone` int(100) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`leads_bio_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `leads_bio_information` (`leads_bio_information_id`, `lead_status`, `connect_lead_id`, `lead_name`, `location`, `phone`, `email`) VALUES
(1,	'active',	'L98340',	'PCEA Karamoja ',	'Karamoja Town',	734563281,	'');

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

INSERT INTO `role` (`role_id`, `role_name`, `created_by`, `last_modified_by`, `created_date`, `last_modified_date`) VALUES
(1,	'PF',	1,	1,	'2019-04-30 07:42:26',	'2019-04-30 04:42:26');

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

-- 2019-06-10 11:31:43
