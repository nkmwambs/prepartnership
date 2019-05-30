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

INSERT INTO `assessment_milestones` (`assessment_milestones_id`, `milestone_name`, `insert_after`, `assessment_period_in_days`, `assessment_review_status`, `user_customized_review_status`) VALUES
(1,	'Testing this',	0,	10,	'Tested',	'Test'),
(2,	'Test 2',	1,	8,	'Test 2',	'Test 2'),
(3,	'T1',	2,	6,	'Test 1',	'Test 2');

CREATE TABLE `assessment_progress_measure` (
  `assessment_progress_measure_id` int(3) NOT NULL AUTO_INCREMENT,
  `Progress_measure_title` varchar(100) NOT NULL,
  `verification_tool` longtext NOT NULL,
  `weight` int(3) NOT NULL,
  `assessment_method` longtext NOT NULL,
  `compassion_connect_mapping` varchar(50) NOT NULL,
  PRIMARY KEY (`assessment_progress_measure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment_progress_measure` (`assessment_progress_measure_id`, `Progress_measure_title`, `verification_tool`, `weight`, `assessment_method`, `compassion_connect_mapping`) VALUES
(6,	'T6',	'X6',	10,	'Y6',	'6'),
(7,	'T2',	'X2',	2,	'Y2',	'2'),
(8,	'T3',	'X3',	3,	'Y3',	'3'),
(9,	'T10',	'X9',	9,	'Y8',	'6'),
(10,	'T5',	'X5',	5,	'Y5',	'6');

CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('07133gvorhinq3v7iprj7rpqhnhvvn5f',	'::1',	1559115639,	'__ci_last_regenerate|i:1559115639;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('0b33ng19govi2ma4r7rsa224e7fa70qd',	'::1',	1559032261,	'__ci_last_regenerate|i:1559032261;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('1kbffov6jrmg4bh0uoaoabrjlt9q4ks6',	'::1',	1559034395,	'__ci_last_regenerate|i:1559034395;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('2f3bro70q38te13avvo2agifq9msbgrd',	'::1',	1559046764,	'__ci_last_regenerate|i:1559046764;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('2j7k9fn4hg1h5p2ro3qhv8denk18r24g',	'::1',	1559110275,	'__ci_last_regenerate|i:1559110275;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('2ns4pi1rm7ea7cendnr788psmfht9b76',	'::1',	1559045809,	'__ci_last_regenerate|i:1559045809;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('3r07rsp8assjjupv693droj3k4lv5fve',	'::1',	1559028542,	'__ci_last_regenerate|i:1559028542;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('4a0lgq2ua3d6k7b061tt4dtvh1cs2foh',	'::1',	1559127328,	'__ci_last_regenerate|i:1559127328;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('4njg8soti9jmpmebcvkqn4tqs38djmf8',	'::1',	1559111005,	'__ci_last_regenerate|i:1559111005;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('68gi1778tfhi185ev9kjsudko81rketa',	'::1',	1559029489,	'__ci_last_regenerate|i:1559029489;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('6au96rseoro257879fjhf7nc4djugmph',	'::1',	1559044592,	'__ci_last_regenerate|i:1559044592;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('6ngh1n3dchhne4id2j1tg2r7msqcdbr9',	'::1',	1559114499,	'__ci_last_regenerate|i:1559114499;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('7hm08i7abt09pck43vcj6ek8lf7fkkod',	'::1',	1559044956,	'__ci_last_regenerate|i:1559044956;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('7qjnsvcer16ct7q6h4pi2jvlgphp9jp8',	'::1',	1559033576,	'__ci_last_regenerate|i:1559033576;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('8va8fp8pjlhig3gidnoc4o6hg5ehoa7l',	'::1',	1559080436,	'__ci_last_regenerate|i:1559080203;view_type|s:9:\"Dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('91kuhjbuun0f619agskqmfvdp789vq1p',	'::1',	1559038276,	'__ci_last_regenerate|i:1559038276;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('ath5haekb53166stk45iihns0t8uuh46',	'::1',	1559028852,	'__ci_last_regenerate|i:1559028852;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('bmesmgec5ia29tp4n7dr9aufijhf2cr2',	'::1',	1559036203,	'__ci_last_regenerate|i:1559036203;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('d5mh8ajfa0to8h6bfgpee58sjb2f7vin',	'::1',	1559031220,	'__ci_last_regenerate|i:1559031220;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('df53qdjevd2pb4o4i9ksuu4b64pveh0t',	'::1',	1559116378,	'__ci_last_regenerate|i:1559116378;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('dqnaa8pem7adfu48m2rqgrtjd91r23bc',	'::1',	1559103302,	'__ci_last_regenerate|i:1559103302;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('ealt6hl76bmb8blptivpgnod0vjt3lom',	'::1',	1559030687,	'__ci_last_regenerate|i:1559030687;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('etdirpodk9suion67omlkvdg98tq47m9',	'::1',	1559029162,	'__ci_last_regenerate|i:1559029162;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('fcde0t1bbcvl2a3pt6o3spmc7lcaskuk',	'::1',	1559103634,	'__ci_last_regenerate|i:1559103634;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('fh5m6mk58n0ode75shsih971dj2ub71r',	'::1',	1559080198,	'__ci_last_regenerate|i:1559079998;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('gn9m606nom1m27loe4cmaub04t49bou3',	'::1',	1559104058,	'__ci_last_regenerate|i:1559104058;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('gusbm1sfsfa31mr9j3q82m2eap75milg',	'::1',	1559110675,	'__ci_last_regenerate|i:1559110675;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('gvum2o7mnl9kkv5abg3ee87566vko0l3',	'::1',	1559080620,	'__ci_last_regenerate|i:1559080615;view_type|s:9:\"Dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('hlmiime3h4qpd5llq36nitgtdecrlpt6',	'::1',	1559046438,	'__ci_last_regenerate|i:1559046438;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('hodjpl413cj97u0thkf2gha6ksrc0a5n',	'::1',	1559127662,	'__ci_last_regenerate|i:1559127662;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('ihvr92ie06dnavo269ts82env4hf0i7k',	'::1',	1559037936,	'__ci_last_regenerate|i:1559037936;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('jrmubeda3l39tf7dso165kgphirgecuu',	'::1',	1559127758,	'__ci_last_regenerate|i:1559127662;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('jvjnse42rdp4vd028tvhb37rc2m9k5h3',	'::1',	1559035835,	'__ci_last_regenerate|i:1559035835;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('k64akl4n2iriktfria56qk169u34ujg8',	'::1',	1559046127,	'__ci_last_regenerate|i:1559046127;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('kbm30ap1o2vciov314gacovmlkga1hm0',	'::1',	1559033914,	'__ci_last_regenerate|i:1559033914;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('kmc4pd7ik838cljs54rhpsdrttk31kfe',	'::1',	1559109937,	'__ci_last_regenerate|i:1559109937;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('llde9l26acst5r5uhtcnugl8244qgmgi',	'::1',	1559047071,	'__ci_last_regenerate|i:1559047071;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('lmke69ji92i9bltmhv8m0fj1c3nvl6rk',	'::1',	1559034991,	'__ci_last_regenerate|i:1559034991;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('mdqjdt5hd4ou6mfffvrejfqeuvqiuk76',	'::1',	1559037534,	'__ci_last_regenerate|i:1559037534;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('mhleguopirh9tf088ml2661jga2b68rs',	'::1',	1559043340,	'__ci_last_regenerate|i:1559043340;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('mm8jm461q0luf97t9mbks4mlcgdbdr5k',	'::1',	1559042814,	'__ci_last_regenerate|i:1559042814;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('nfn8met6uopkpce8darbhc5s2m3t1voh',	'::1',	1559102728,	'__ci_last_regenerate|i:1559102728;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('nm587clb907q2l2c7mh40e2dluu1uilu',	'::1',	1559037196,	'__ci_last_regenerate|i:1559037196;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('p27pp84688ss5m7mfpfgrtup1dkhvhr6',	'::1',	1559045299,	'__ci_last_regenerate|i:1559045299;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('qa8cqtbgmsj9nmbekqnqnff5egkpugq3',	'::1',	1559047407,	'__ci_last_regenerate|i:1559047407;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('qb3u96ctnbchrb8uki7ar39smhmj57sl',	'::1',	1559047483,	'__ci_last_regenerate|i:1559047407;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:5:\"leads\";'),
('qh8qqv7ec9g2ad8bd67838f9uquau2bh',	'::1',	1559043920,	'__ci_last_regenerate|i:1559043920;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('rd9q9jfgglmbedgok1ceoqd69kn263sg',	'::1',	1559036661,	'__ci_last_regenerate|i:1559036661;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('rdcj58lr5pqbrmqc6pt00j5uocj9t1qg',	'::1',	1559031654,	'__ci_last_regenerate|i:1559031654;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('sg4nlv218l29rldtgpfo3foipl9n5lnj',	'::1',	1559035473,	'__ci_last_regenerate|i:1559035473;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('upclg7a4hu9pdkvrd4fc6v7q2dm568ni',	'::1',	1559039588,	'__ci_last_regenerate|i:1559039588;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('uvoivohvqhm5ui87rq77civm2mh1nggk',	'::1',	1559029803,	'__ci_last_regenerate|i:1559029803;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('vhdk1j2ljdvgct1jltheh4ugesiedd09',	'::1',	1559116390,	'__ci_last_regenerate|i:1559116378;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";');

CREATE TABLE `compassion_connect_mapping` (
  `compassion_connect_mapping_id` int(3) NOT NULL AUTO_INCREMENT,
  `lead_score_parameter` varchar(50) NOT NULL,
  `lead_score_stage` int(5) NOT NULL,
  PRIMARY KEY (`compassion_connect_mapping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `compassion_connect_mapping` (`compassion_connect_mapping_id`, `lead_score_parameter`, `lead_score_stage`) VALUES
(1,	'Test',	1),
(2,	'Test 0',	2),
(3,	'Test 2',	1),
(4,	'T1',	1),
(5,	'T2',	2),
(6,	'T3',	2);

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
(183,	'Show Field?',	'',	'',	'',	'',	NULL,	NULL),
(184,	'leads_information',	'',	'',	'',	'',	NULL,	NULL),
(185,	'Lead Name',	'',	'',	'',	'',	NULL,	NULL),
(186,	'Location',	'',	'',	'',	'',	NULL,	NULL),
(187,	'Size Of Land',	'',	'',	'',	'',	NULL,	NULL),
(188,	'Congregation Type',	'',	'',	'',	'',	NULL,	NULL),
(189,	'Lead Pastor Name',	'',	'',	'',	'',	NULL,	NULL),
(190,	'Lead Bio Fields Name',	'',	'',	'',	'',	NULL,	NULL),
(191,	'Lead Bio Info Column',	'',	'',	'',	'',	NULL,	NULL),
(192,	'Datatype Id',	'',	'',	'',	'',	NULL,	NULL),
(193,	'Is Field Unique',	'',	'',	'',	'',	NULL,	NULL),
(194,	'Is Field Null',	'',	'',	'',	'',	NULL,	NULL),
(195,	'Assessment Period In Days',	'',	'',	'',	'',	NULL,	NULL),
(196,	'lead_bio_information',	'',	'',	'',	'',	NULL,	NULL),
(197,	'lead_bio_info_column',	'',	'',	'',	'',	NULL,	NULL),
(198,	'show_field',	'',	'',	'',	'',	NULL,	NULL),
(199,	'leads_bio_information_id',	'',	'',	'',	'',	NULL,	NULL),
(200,	'lead_name',	'',	'',	'',	'',	NULL,	NULL),
(201,	'size_of_land',	'',	'',	'',	'',	NULL,	NULL),
(202,	'congregation_type',	'',	'',	'',	'',	NULL,	NULL),
(203,	'lead_pastor_name',	'',	'',	'',	'',	NULL,	NULL),
(204,	'Is Field In Use?',	'',	'',	'',	'',	NULL,	NULL),
(205,	'Is Field In Use',	'',	'',	'',	'',	NULL,	NULL);

CREATE TABLE `leads_bio_information` (
  `leads_bio_information_id` int(100) NOT NULL AUTO_INCREMENT,
  `lead_name` longtext,
  `phone` longtext,
  `location` longtext,
  `address` longtext,
  `size_of_land` longtext,
  `congregation_type` longtext,
  `lead_pastor_name` longtext,
  PRIMARY KEY (`leads_bio_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `leads_bio_information` (`leads_bio_information_id`, `lead_name`, `phone`, `location`, `address`, `size_of_land`, `congregation_type`, `lead_pastor_name`) VALUES
(1,	'PCEA Echoro Emuny',	'0711808071',	'Ngong',	'Ngong Road',	'2 acres',	NULL,	'Pastor Rev. Karanja');

CREATE TABLE `lead_bio_fields` (
  `lead_bio_fields_id` int(100) NOT NULL AUTO_INCREMENT,
  `lead_bio_fields_name` varchar(100) NOT NULL,
  `lead_bio_info_column` varchar(100) NOT NULL,
  `datatype_id` int(100) NOT NULL,
  `is_field_unique` int(5) NOT NULL DEFAULT '1',
  `is_field_null` int(5) NOT NULL DEFAULT '0',
  `default_value` varchar(20) NOT NULL,
  `show_field` int(5) NOT NULL DEFAULT '1' COMMENT '1= Show on summary and lead information listing,0 = Don''t show on summary and lead information listing',
  `is_suspended` int(5) NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  PRIMARY KEY (`lead_bio_fields_id`),
  KEY `datatype_id` (`datatype_id`),
  CONSTRAINT `lead_bio_fields_ibfk_1` FOREIGN KEY (`datatype_id`) REFERENCES `datatype` (`datatype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `lead_bio_fields` (`lead_bio_fields_id`, `lead_bio_fields_name`, `lead_bio_info_column`, `datatype_id`, `is_field_unique`, `is_field_null`, `default_value`, `show_field`, `is_suspended`) VALUES
(68,	'Lead Name',	'lead_name',	1,	0,	0,	'Tested',	1,	0),
(69,	'Phone',	'phone',	2,	1,	0,	'',	1,	0),
(70,	'Location',	'location',	1,	0,	0,	'',	1,	0),
(71,	'Address',	'address',	1,	0,	0,	'',	0,	0),
(72,	'Size of Land',	'size_of_land',	2,	0,	0,	'',	0,	0),
(73,	'Congregation Type',	'congregation_type',	1,	0,	0,	'',	0,	0),
(74,	'Lead Pastor Name',	'lead_pastor_name',	1,	0,	0,	'',	1,	0);

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

-- 2019-05-29 12:49:28
