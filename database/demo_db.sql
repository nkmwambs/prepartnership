
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
(5,     6,      1),
(6,     7,      1),
(7,     8,      1),
(8,     9,      1),
(9,     3,      1),
(10,    10,     1),
(11,    11,     1),
(12,    12,     1),
(13,    13,     1),
(14,    14,     1),
(15,    15,     1),
(16,    16,     1),
(17,    17,     1),
(18,    18,     1),
(19,    19,     1),
(20,    20,     1),
(21,    21,     1),
(22,    22,     1),
(23,    23,     1);

CREATE TABLE `assessment` (
  `assessment_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_milestones_id` int(3) NOT NULL,
  PRIMARY KEY (`assessment_id`),
  KEY `assessment_milestones_id` (`assessment_milestones_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `assessment` (`assessment_id`, `assessment_milestones_id`) VALUES
(1,     0);

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
(1,     'Initial assessment',  3,      10,     'Tested',        'Test'),
(2,     'Mid One Assessment',  5,      8,      'Test 2',        'Test 2'),
(3,     'Mid Two Assessment',  4,      4,      'Hurray!!!',        'Hurray!'),
(4,     'Mid Three Assessment',        0,      12,     '',        'Test 304940'),
(5,     'Summative Assessment',        1,      4,      '',        'Tes356');

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
(1,     'De6',  'De',   6,      'De',   '3'),
(2,     'De',   'De',   3,      'De',   '2'),
(3,     'Test', 'Test', 3,      'Test', '2'),
(4,     'Test 2',      'Test 2',      3,      'Test4',        '1'),
(5,     'T',    't',    3,      't',    '2'),
(6,     'Test 30',     'Test', 2,      'Test', '1'),
(7,     'No match',    'No match',    5,      'No match',        '1'),
(8,     'Test 40',     'Test', 2,      'Test', '1'),
(9,     'test', 'test', 1,      'test', '1'),
(10,    'Test55',      'Test55',      3,      'Test55',        '1');

CREATE TABLE `ci_sessions` (
  `id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('133sk2tf9rhrafu0t0rh910mcn608mod',  '::1',  1558691214, '__ci_last_regenerate|i:1558691214;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('1ptius1o7bgiq4p2rli9dvuejfvic8j3',  '::1',  1558957574, '__ci_last_regenerate|i:1558957574;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('2204r9ri0hs7qmgjnabgu22kpkn2he7v',  '::1',  1558705755, '__ci_last_regenerate|i:1558705755;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('23len1gcdveomjptm9f4j4ghio087g43',  '::1',  1558961697, '__ci_last_regenerate|i:1558961697;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('2mdumfs4aceu6nh7ph6p0ghchn89dk07',  '::1',  1560167537, '__ci_last_regenerate|i:1560167530;view_type|s:9:\"dashboard\";'),
('4agnvl1qmummb3si49akg1fd5f3pu5u9',  '::1',  1558960315, '__ci_last_regenerate|i:1558960315;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('4gnbam6bervaqdhr6d611hnhraheo2tn',  '::1',  1558699173, '__ci_last_regenerate|i:1558699173;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('4kfpr73mjl1rsljribeoa7fpu4rv5lvo',  '::1',  1558686376, '__ci_last_regenerate|i:1558686376;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('4lb5pkuctha1fb66vq37bib1cghhel83',  '::1',  1558685980, '__ci_last_regenerate|i:1558685980;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('522hhmufua814udi6i0bu3lm6breaqgl',  '::1',  1558962697, '__ci_last_regenerate|i:1558962697;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('53dcbq72cvjo1gol2128jdjk1tuv51u5',  '::1',  1558702443, '__ci_last_regenerate|i:1558702443;view_type|s:9:\"Dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('5bo0m4j9foa2cq1hnk5vld9j3mbhc0pb',  '::1',  1558690256, '__ci_last_regenerate|i:1558690256;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('5nbqj0medlki1i94rehe6i2h34f1f6r4',  '::1',  1558685580, '__ci_last_regenerate|i:1558685580;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('5nmpduqfv5fjbdgc4e7ddeqf9bv8adfe',  '::1',  1558679600, '__ci_last_regenerate|i:1558679600;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('5pnb657u48r2hbb9t2i33u0d025nm8lm',  '::1',  1558966934, '__ci_last_regenerate|i:1558966934;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('61ebpq477675kpfs6n5ecu3fh76jnjss',  '::1',  1558674024, '__ci_last_regenerate|i:1558674024;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('6pep75eij44svnvqgn8fke12sbid5dp4',  '::1',  1558706968, '__ci_last_regenerate|i:1558706968;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('6tvm7hj9kitqddc224mehqf03h7rdflj',  '::1',  1558963405, '__ci_last_regenerate|i:1558963405;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('80lvl18k2puahc7b9j0b7rj48m79cptl',  '::1',  1558960953, '__ci_last_regenerate|i:1558960953;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('8tv7085bucnsb2b84e4hj2q3qgj2ihih',  '::1',  1558672994, '__ci_last_regenerate|i:1558672994;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('9c3jl7ss5ij40vfjbfinls8s4pbruh8i',  '::1',  1558958774, '__ci_last_regenerate|i:1558958774;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('9jnm5mn2uuv4c39j3uvu64275fs95702',  '::1',  1558700908, '__ci_last_regenerate|i:1558700908;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('9to9c12tam0ua1vaqld4kuu8tid7luka',  '::1',  1558701235, '__ci_last_regenerate|i:1558701235;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('9u6nvd2ta33d3jrlb9v8bhvsdc0d35il',  '::1',  1558968269, '__ci_last_regenerate|i:1558968219;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('a4iock28jl44gd1famphf5ov4hkiafp0',  '::1',  1558684846, '__ci_last_regenerate|i:1558684846;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('afi763lkuv8p5aedhuphu7s5vv8koriv',  '::1',  1558690563, '__ci_last_regenerate|i:1558690563;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('aovoteeka2qds2kk0l85q61234oukhnr',  '::1',  1558673698, '__ci_last_regenerate|i:1558673698;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('asmublhb06thq5jn1dkds3tkencf7504',  '::1',  1558966276, '__ci_last_regenerate|i:1558966276;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('b1948loclvl8hpbt2o3cgu79gh8ismqr',  '::1',  1558705437, '__ci_last_regenerate|i:1558705437;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('b5d22ev6bngjf7h9ttjo4lkkgomv8e84',  '::1',  1558698058, '__ci_last_regenerate|i:1558698058;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('bdhnnh246608mv708237tkutuk11kg3c',  '::1',  1558682951, '__ci_last_regenerate|i:1558682951;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('bjbd4hrjrol44l4kt44lbmvjbf4ljbhh',  '::1',  1558707065, '__ci_last_regenerate|i:1558706968;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('blb6eh7rh2mm0ojc07t5r1av3rjghn1e',  '::1',  1558959617, '__ci_last_regenerate|i:1558959617;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('blnnqk1b7aih48pah5coigff30mpfn72',  '::1',  1558706482, '__ci_last_regenerate|i:1558706482;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('bm8cb7euracsv6t0ftiem3hj8j5pethg',  '::1',  1558689172, '__ci_last_regenerate|i:1558689172;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('c63h1dieshv9dmqu8ev71soir652lu4s',  '::1',  1558704702, '__ci_last_regenerate|i:1558704702;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('cda7ltrm5puom0vlp1ekr1p9fe6m2dn9',  '::1',  1558701567, '__ci_last_regenerate|i:1558701567;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('ck8fnd95r74jg3rg3ccv7ooku62t1uls',  '::1',  1558673303, '__ci_last_regenerate|i:1558673303;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('d4t87btbtmqvkrtvvidsfth7he2cgdeq',  '::1',  1558706172, '__ci_last_regenerate|i:1558706172;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('d7svc0pfvudjujeb8sctkqfpvp4a9dgt',  '::1',  1558968219, '__ci_last_regenerate|i:1558968219;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('dj671d0ki7luttad975nk0etbinrc30q',  '::1',  1558704333, '__ci_last_regenerate|i:1558704333;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('do7s5aruq95ilj9tq29gn2nb2gmlhb9j',  '::1',  1558967902, '__ci_last_regenerate|i:1558967902;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('dp9qjh31k9qgh2e9uig02svqskgdbarc',  '::1',  1558681173, '__ci_last_regenerate|i:1558681173;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('dufovssbv5a4epqiethop2f1jkaph0kl',  '::1',  1558686714, '__ci_last_regenerate|i:1558686714;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('ehrf6418akbq2k4jrrs5qm9ifup0iejk',  '::1',  1558698422, '__ci_last_regenerate|i:1558698422;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('fdgu442ult2amv3sau9isen2i140m6us',  '::1',  1558678988, '__ci_last_regenerate|i:1558678988;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('friji72niqu81h9lcj6ip0occ8osefjq',  '::1',  1558967294, '__ci_last_regenerate|i:1558967294;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('g4bl2r3ukes5o3tv8s5hfh5a4s93sa3b',  '::1',  1558683760, '__ci_last_regenerate|i:1558683760;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('g69lkcu3k0sup9okhms5macg4f74kp24',  '::1',  1558700502, '__ci_last_regenerate|i:1558700502;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('ggfu10j3fosgalqv2qp7e51nuhh7uftu',  '::1',  1558684471, '__ci_last_regenerate|i:1558684471;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('ghpb84n7sabck33c1d0kq0h44cmq4gm2',  '::1',  1558958380, '__ci_last_regenerate|i:1558958380;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('h11ighloqvg3lfq4f44o28jnef0np40q',  '::1',  1558964072, '__ci_last_regenerate|i:1558964072;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('hasovnsgivthqtk105gfb2hd5atuatls',  '::1',  1558957273, '__ci_last_regenerate|i:1558957273;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('hnjp0s5qn32pn4661650oj2lnadc6saf',  '::1',  1558955564,        '__ci_last_regenerate|i:1558955564;'),
('i67cmbu7da4p0mgjtp3dnpr16rhdadad',  '::1',  1558687961, '__ci_last_regenerate|i:1558687961;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('ib97cl4np26e5ajmuees3rt8ipp72a6l',  '::1',  1558965043, '__ci_last_regenerate|i:1558965043;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('iqk1obubhrgb864a2cl0lp9kmtoclcqg',  '::1',  1558690896, '__ci_last_regenerate|i:1558690896;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('itj783frj8176d34poige46fbh9t0gru',  '::1',  1558961326, '__ci_last_regenerate|i:1558961326;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('j6usq5a541srkno3p8tq7lspnhs209nv',  '::1',  1558967600, '__ci_last_regenerate|i:1558967600;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('jag7c49osk3voclmvp0cesgag8ka7uv3',  '::1',  1558703662, '__ci_last_regenerate|i:1558703662;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('k134d72dmucp2dkiuflac2snk0cteej0',  '::1',  1558703136, '__ci_last_regenerate|i:1558703136;view_type|s:9:\"Dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('k15c8ba92b1rqrpv8p74drimsnbkp7po',  '::1',  1558703980, '__ci_last_regenerate|i:1558703980;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('k8mpih657o701af0p9ve0q7m5mfpjgql',  '::1',  1558960003, '__ci_last_regenerate|i:1558960003;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('kdft3qfre5e3m9ed542lphebqt57m5mt',  '::1',  1558679935, '__ci_last_regenerate|i:1558679935;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('kg0hrtg88uct6sk7ek83odlur24lur4l',  '::1',  1558691819, '__ci_last_regenerate|i:1558691819;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('kjj3ua9efqcnv6d899pju06nkr0qmius',  '::1',  1558697739, '__ci_last_regenerate|i:1558697739;view_type|s:8:\"settings\";'),
('lh3lchbbj3hc3rok79t0n9204g0pomeb',  '::1',  1558684162, '__ci_last_regenerate|i:1558684162;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('m26nltd1vfcunmgjrvn29ilvhhombvi4',  '::1',  1560174118, '__ci_last_regenerate|i:1560174084;view_type|s:9:\"dashboard\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('n0abt8hqcbu52tdc85is6pu1n7rvj3r4',  '::1',  1558682542, '__ci_last_regenerate|i:1558682542;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('n6crghi3ech7ik01m6n0bsqlpspljqge',  '::1',  1558672645, '__ci_last_regenerate|i:1558672645;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('n96198hj2nnitkfg0gfukh6ju510bods',  '::1',  1558965559, '__ci_last_regenerate|i:1558965559;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:9:\"Dashboard\";'),
('nep2e47qmi5hv7udbtu8rkuu5lnq88jf',  '::1',  1558960630, '__ci_last_regenerate|i:1558960630;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('nibissm8ib83hpthrfsfj52k7clk8de2',  '::1',  1558683416, '__ci_last_regenerate|i:1558683416;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('p0ci5aifc4mb68jlo02btu2g35qr922r',  '::1',  1558685251, '__ci_last_regenerate|i:1558685251;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('p4599jf35ra8l0uc0945asti1tohppb6',  '::1',  1558702082, '__ci_last_regenerate|i:1558702082;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('p477f56k5937g9hj8dk816hmkd4umblr',  '::1',  1558691518, '__ci_last_regenerate|i:1558691518;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('p8ofoea08j109r4ndl22jkhc4n5tq332',  '::1',  1558964500, '__ci_last_regenerate|i:1558964500;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('q1cldugn9sgvh9dqjbe8c4io7m7jfgar',  '::1',  1558688426, '__ci_last_regenerate|i:1558688426;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('q6aqa1tkcs6rshtn1qtcqc7hktvrllcg',  '::1',  1558687587, '__ci_last_regenerate|i:1558687587;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('qq9mvmjoenc7kr2vth48s61s4vs20q5u',  '::1',  1558705027, '__ci_last_regenerate|i:1558705027;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('r1fvm59rhs4f77hjl46ho0jnvar8jl21',  '::1',  1558688752, '__ci_last_regenerate|i:1558688752;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('rbqn57vd5ff7eaaq8bt8tf7g4aht0s15',  '::1',  1558699791, '__ci_last_regenerate|i:1558699791;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('rg7beaoag2ilkiq5tbffdlsovglngp4k',  '::1',  1558692104, '__ci_last_regenerate|i:1558691819;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('s3dtss7j84avmqb36mjg10hehjn5b8a1',  '::1',  1558672238, '__ci_last_regenerate|i:1558672238;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('srkclkl8a96cusjo0tl4h4ul98ukgtvb',  '::1',  1558956108, '__ci_last_regenerate|i:1558956108;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('suekhmskpfcaah2oc92omjhjf2rtbe9q',  '::1',  1558963742, '__ci_last_regenerate|i:1558963742;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('t90igpkp72pnqoopeccjk34756nm1ei1',  '::1',  1558700201, '__ci_last_regenerate|i:1558700201;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('tp0k9o8qas01p7kt0eje7po91teslqbg',  '::1',  1558698747, '__ci_last_regenerate|i:1558698747;view_type|s:8:\"settings\";user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";'),
('tt8sqps0vm1h3vof6h96r7sgueplpi6m',  '::1',  1558965906, '__ci_last_regenerate|i:1558965906;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('ue5hu77bfd1cb5quoks1t2vj3sdnj871',  '::1',  1558957923, '__ci_last_regenerate|i:1558957923;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('uqbm4mm1mqb0idgahua4j4nve24t47qt',  '::1',  1558956956, '__ci_last_regenerate|i:1558956956;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('v9gu0q265boda3vvfhhsp6ut4fkupv4i',  '::1',  1558687257, '__ci_last_regenerate|i:1558687257;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('vedj1odi05ula7ds0u45qmfft9o4o6su',  '::1',  1558963099, '__ci_last_regenerate|i:1558963099;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";'),
('vpslmdcjtaji724cafq5t8cabbp3tgok',  '::1',  1558966607, '__ci_last_regenerate|i:1558966607;user_login|s:1:\"1\";login_user_id|s:1:\"1\";name|s:11:\"Livingstone\";role_name|s:2:\"PF\";profile_id|s:1:\"1\";role_id|s:1:\"1\";profile_name|s:8:\"Assessor\";view_type|s:8:\"settings\";');

CREATE TABLE `compassion_connect_mapping` (
  `compassion_connect_mapping_id` int(3) NOT NULL AUTO_INCREMENT,
  `lead_score_parameter` varchar(50) NOT NULL,
  `lead_score_stage` int(5) NOT NULL,
  PRIMARY KEY (`compassion_connect_mapping_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `compassion_connect_mapping` (`compassion_connect_mapping_id`, `lead_score_parameter`, `lead_score_stage`) VALUES
(1,     'No Match',    0),
(2,     'Test 0',      2),
(3,     'Test 2',      1),
(4,     'Test Delete', 2);

CREATE TABLE `connect_stage` (
  `connect_stage_id` int(10) NOT NULL AUTO_INCREMENT,
  `connect_stage_name` varchar(20) NOT NULL,
  PRIMARY KEY (`connect_stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `connect_stage` (`connect_stage_id`, `connect_stage_name`) VALUES
(1,     'Stage 1'),
(2,     'Stage 2');

CREATE TABLE `datatype` (
  `datatype_id` int(100) NOT NULL AUTO_INCREMENT,
  `datatype_name` varchar(20) NOT NULL,
  PRIMARY KEY (`datatype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `datatype` (`datatype_id`, `datatype_name`) VALUES
(1,     'text'),
(2,     'number');

CREATE TABLE `entitlement` (
  `entitlement_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `derivative_id` int(10) NOT NULL,
  `visibility` int(5) NOT NULL,
  PRIMARY KEY (`entitlement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `entitlement` (`entitlement_id`, `name`, `derivative_id`, `visibility`) VALUES
(2,     'dashboard',   0,      1),
(3,     'test_button', 2,      1),
(5,     'settings',    0,      1),
(6,     'user_profiles',       5,      1),
(7,     'set_up_entitlement',  5,      1),
(8,     'edit_profile', 5,      1),
(9,     'delete_profile',      5,      1),
(10,    'general_settings',    5,      1),
(11,    'language_settings',   5,      1),
(12,    'assessment_settings', 5,      1),
(13,    'lead_bio_settings',   5,      1),
(14,    'assessment_milestones',       5,      1),
(15,    'connect_progress_measures',   5,      1),
(16,    'assessment_progress_measures',       5,      1),
(17,    'account',     0,      1),
(18,    'leads',       0,      1),
(19,    'active_leads', 18,     1),
(20,    'closed_leads', 18,     1),
(21,    'change_password',     17,     1),
(22,    'edit_profile', 17,     1),
(23,    'language',    17,     1);

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
(81,    'Field Name',  'A tooltip example',   '',     '',        '',     NULL,   NULL),
(82,    'Data Type',   '',     '',     '',     '',     NULL,        NULL),
(83,    'Is Field Unique?',    '',     '',     '',     '',        NULL,   NULL),
(84,    'Is Field Null?',      '',     '',     '',     '',        NULL,   NULL),
(85,    'default_value',       '',     '',     '',     '',        NULL,   NULL),
(86,    'assessment_settings', '',     '',     '',     '',        NULL,   NULL),
(87,    'dashboard',   '',     '',     '',     '',     NULL,        NULL),
(88,    'settings',    '',     '',     '',     '',     NULL,        NULL),
(89,    'general_settings',    '',     '',     '',     '',        NULL,   NULL),
(90,    'sms_settings', '',     '',     '',     '',     NULL,        NULL),
(91,    'language_settings',   '',     '',     '',     '',        NULL,   NULL),
(92,    'lead_bio_fields',     '',     '',     '',     '',        NULL,   NULL),
(93,    'assessment_milestones',       '',     '',     '',        '',     NULL,   NULL),
(94,    'connect_progress_measures',   '',     '',     '',        '',     NULL,   NULL),
(95,    'assessment_progress_measures',       '',     '',        '',     '',     NULL,   NULL),
(96,    'user_profiles',       '',     '',     '',     '',        NULL,   NULL),
(97,    'edit_profile', '',     '',     '',     '',     NULL,        NULL),
(98,    'change_password',     '',     '',     '',     '',        NULL,   NULL),
(99,    'language',    '',     '',     '',     '',     NULL,        NULL),
(100,   'back', '',     '',     '',     '',     NULL,        NULL),
(101,   'go_back',     '',     '',     '',     '',     NULL,        NULL),
(102,   'Are_you_sure_you_want_to_perform_this_action?',        '',     '',     '',     '',     NULL,   NULL),
(103,   'process_aborted',     '',     '',     '',     '',        NULL,   NULL),
(104,   'please_wait_until_you_receive_confirmation', '',        '',     '',     '',     NULL,   NULL),
(105,   'delete',      '',     '',     '',     '',     NULL,        NULL),
(106,   'cancel',      '',     '',     '',     '',     NULL,        NULL),
(107,   'Ok',   '',     '',     '',     '',     NULL,        NULL),
(108,   'Assessment Milestone Name:',  '',     '',     '',        '',     NULL,   NULL),
(109,   'Insert Milestone After',      '',     '',     '',        '',     NULL,   NULL),
(110,   'Period Needed to Complete(in months)',       '',        '',     '',     '',     NULL,   NULL),
(111,   'Assessment Review Status',    '',     '',     '',        '',     NULL,   NULL),
(112,   'User Customized Review Status',      '',     '',        '',     '',     NULL,   NULL),
(113,   'Field Unique?',       '',     '',     '',     '',        NULL,   NULL),
(114,   'Optional?',   '',     '',     '',     '',     NULL,        NULL),
(115,   'Default Value',       '',     '',     '',     '',        NULL,   NULL),
(116,   'Milestone Name',      'The name of the assessment milestone',    '',     '',     '',     NULL,   NULL),
(117,   'When', '',     '',     '',     '',     NULL,        NULL),
(118,   'Review Status',       '',     '',     '',     '',        NULL,   NULL),
(119,   'login',       '',     '',     '',     '',     NULL,        NULL),
(120,   'forgot_your_password',        '',     '',     '',        '',     NULL,   NULL),
(121,   'initial_assessment',  '',     '',     '',     '',        NULL,   NULL),
(122,   'Lead Score Criteria Parameter',      '',     '',        '',     '',     NULL,   NULL),
(123,   'Lead Score Stage',    '',     '',     '',     '',        NULL,   NULL),
(124,   'Connect Lead Score Stage',    '',     '',     '',        '',     NULL,   NULL),
(125,   'Progress Measure',    '',     '',     '',     '',        NULL,   NULL),
(126,   'Tools Of Verification',       '',     '',     '',        '',     NULL,   NULL),
(127,   'Progress Measure Weight',     '',     '',     '',        '',     NULL,   NULL),
(128,   'CC Mapping',  '',     '',     '',     '',     NULL,        NULL),
(129,   'Progress Measure Title',      '',     '',     '',        '',     NULL,   NULL),
(130,   'Verification Tools',  '',     '',     '',     '',        NULL,   NULL),
(131,   'Method of assessment',        '',     '',     '',        '',     NULL,   NULL),
(132,   'Weight',      '',     '',     '',     '',     NULL,        NULL),
(133,   'Connect Mapping',     '',     '',     '',     '',        NULL,   NULL),
(134,   'account',     '',     '',     '',     '',     NULL,        NULL),
(135,   'entitlement', '',     '',     '',     '',     NULL,        NULL),
(136,   'log_out',     '',     '',     '',     '',     NULL,        NULL),
(137,   'forward',     '',     '',     '',     '',     NULL,        NULL),
(138,   'system_settings',     '',     '',     '',     '',        NULL,   NULL),
(139,   'system_name', '',     '',     '',     '',     NULL,        NULL),
(140,   'system_title', '',     '',     '',     '',     NULL,        NULL),
(141,   'address',     '',     '',     '',     '',     NULL,        NULL),
(142,   'phone',       '',     '',     '',     '',     NULL,        NULL),
(143,   'system_email', '',     '',     '',     '',     NULL,        NULL),
(144,   'text_align',  '',     '',     '',     '',     NULL,        NULL),
(145,   'sidebar_collapsed',   '',     '',     '',     '',        NULL,   NULL),
(146,   'yes',  '',     '',     '',     '',     NULL,        NULL),
(147,   'no',   '',     '',     '',     '',     NULL,        NULL),
(148,   'save', '',     '',     '',     '',     NULL,        NULL),
(149,   'update_product',      '',     '',     '',     '',        NULL,   NULL),
(150,   'file', '',     '',     '',     '',     NULL,        NULL),
(151,   'install_update',      '',     '',     '',     '',        NULL,   NULL),
(152,   'theme_settings',      '',     '',     '',     '',        NULL,   NULL),
(153,   'default',     '',     '',     '',     '',     NULL,        NULL),
(154,   'select_theme', '',     '',     '',     '',     NULL,        NULL),
(155,   'select_a_theme_to_make_changes',     '',     '',        '',     '',     NULL,   NULL),
(156,   'upload_logo', '',     '',     '',     '',     NULL,        NULL),
(157,   'photo',       '',     '',     '',     '',     NULL,        NULL),
(158,   'upload',      '',     '',     '',     '',     NULL,        NULL),
(159,   'leads',       '',     '',     '',     '',     NULL,        NULL),
(160,   'active_leads', '',     '',     '',     '',     NULL,        NULL),
(161,   'closed_leads', '',     '',     '',     '',     NULL,        NULL),
(162,   'Insert After', '',     '',     '',     '',     NULL,        NULL),
(163,   'lead_bio_fields_id',  '',     '',     '',     '',        NULL,   NULL),
(164,   'datatype_id', '',     '',     '',     '',     NULL,        NULL),
(165,   'Data Type ID', '',     '',     '',     '',     NULL,        NULL),
(166,   'lead_bio_fields_name',        '',     '',     '',        '',     NULL,   NULL),
(167,   'datatype_name',       '',     '',     '',     '',        NULL,   NULL),
(168,   'is_field_unique',     '',     '',     '',     '',        NULL,   NULL),
(169,   'is_field_null',       '',     '',     '',     '',        NULL,   NULL),
(170,   'milestone_name',      '',     '',     '',     '',        NULL,   NULL),
(171,   'insert_after', '',     '',     '',     '',     NULL,        NULL),
(172,   'assessment_period_in_days',   '',     '',     '',        '',     NULL,   NULL),
(173,   'assessment_review_status',    '',     '',     '',        '',     NULL,   NULL),
(174,   'user_customized_review_status',      '',     '',        '',     '',     NULL,   NULL),
(175,   'Progress_Measure_title',      '',     '',     '',        '',     NULL,   NULL),
(176,   'verification_tool',   '',     '',     '',     '',        NULL,   NULL),
(177,   'assessment_method',   '',     '',     '',     '',        NULL,   NULL),
(178,   'compassion_connect_mapping',  '',     '',     '',        '',     NULL,   NULL),
(179,   'lead_score_parameter',        '',     '',     '',        '',     NULL,   NULL),
(180,   'lead_score_stage',    '',     '',     '',     '',        NULL,   NULL),
(181,   'Label Not Provided',  '',     '',     '',     '',        NULL,   NULL),
(182,   'Show Field',  '',     '',     '',     '',     NULL,        NULL),
(183,   'leads_information',   '',     '',     '',     '',        NULL,   NULL),
(184,   'Show Field?', '',     '',     '',     '',     NULL,        NULL),
(185,   'Test1',       '',     '',     '',     '',     NULL,        NULL),
(186,   'Tes2', '',     '',     '',     '',     NULL,        NULL),
(187,   'Test 3',      '',     '',     '',     '',     NULL,        NULL),
(188,   'test_3',      '',     '',     '',     '',     NULL,        NULL),
(189,   'lead_bio_information',        '',     '',     '',        '',     NULL,   NULL),
(190,   'Assessment Period In Days',   '',     '',     '',        '',     NULL,   NULL),
(191,   'Is Field In Use?',    '',     '',     '',     '',        NULL,   NULL),
(192,   'Is Field In Use',     '',     '',     '',     '',        NULL,   NULL),
(193,   'Assessment Id',       '',     '',     '',     '',        NULL,   NULL),
(194,   'Lead Name',   '',     '',     '',     '',     NULL,        NULL),
(195,   'Email',       '',     '',     '',     '',     NULL,        NULL),
(196,   'assessment_id',       '',     '',     '',     '',        NULL,   NULL),
(197,   'lead_name',   '',     '',     '',     '',     NULL,        NULL),
(198,   'leads_bio_information_id',    '',     '',     '',        '',     NULL,   NULL),
(199,   'lead_bio_info_column',        '',     '',     '',        '',     NULL,   NULL),
(200,   'show_field',  '',     '',     '',     '',     NULL,        NULL),
(201,   'is_suspended', '',     '',     '',     '',     NULL,        NULL),
(202,   'assessment_milestones_id',    '',     '',     '',        '',     NULL,   NULL),
(203,   'Lead Status', '',     '',     '',     '',     NULL,        NULL),
(204,   'lead_status', '',     '',     '',     '',     NULL,        NULL),
(205,   'Kkk',  '',     '',     '',     '',     NULL,        NULL),
(206,   'Lead Contact', '',     '',     '',     '',     NULL,        NULL),
(207,   'Lead Fax',    '',     '',     '',     '',     NULL,        NULL),
(208,   'lead_contact', '',     '',     '',     '',     NULL,        NULL),
(209,   'lead_fax_no', '',     '',     '',     '',     NULL,        NULL),
(210,   'Connnect Leadid',     '',     '',     '',     '',        NULL,   NULL),
(211,   'add_new_record',      '',     '',     '',     '',        NULL,   NULL),
(212,   'action',      '',     '',     '',     '',     NULL,        NULL),
(213,   'general comment',     '',     '',     '',     '',        NULL,   NULL),
(214,   'category',    '',     '',     '',     '',     NULL,        NULL),
(215,   'visibility',  '',     '',     '',     '',     NULL,        NULL),
(216,   'nominate_unit',       '',     '',     '',     '',        NULL,   NULL),
(217,   'comment',     '',     '',     '',     '',     NULL,        NULL),
(218,   'progress_measure',    '',     '',     '',     '',        NULL,   NULL),
(219,   'verication_tools',    '',     '',     '',     '',        NULL,   NULL),
(220,   'method_of_assessment',        '',     '',     '',        '',     NULL,   NULL),
(221,   'score',       '',     '',     '',     '',     NULL,        NULL),
(222,   'functional_strategic_document',      '',     '',        '',     '',     NULL,   NULL),
(223,   'records-review',      '',     '',     '',     '',        NULL,   NULL),
(224,   'focused_discussions', '',     '',     '',     '',        NULL,   NULL),
(225,   'observation', '',     '',     '',     '',     NULL,        NULL),
(226,       'documented_selection_process_for_ministry_leaders',        '',     '',     '',     '',     NULL,   NULL),
(227,   'church_organizational_chart', '',     '',     '',        '',     NULL,   NULL),
(228,   'church_ministry_leaders_in_place',   '',     '',        '',     '',     NULL,   NULL),
(229,   'evidence_of_adherence_to_statutory_HR_structures. ',      '',     '',     '',     '',     NULL,   NULL),
(230,   'annual_financial_statement  ',       '',     '',        '',     '',     NULL,   NULL),
(231,   'evidence_of_adherence_to_statutory_HR_structures',        '',     '',     '',     '',     NULL,   NULL),
(232, 'availability_of_employees_and_volunteers_for_CY_ministry_in_the_church',        '',     '',     '',     '',     NULL,   NULL),
(233,  'evidence_of_Operational_procedures_&_financial_records',        '',     '',     '',     '',     NULL,   NULL),
(234,   'a_vailability_of_adequate_space',    '',     '',        '',     '',     NULL,   NULL),
(235,   'safe_child_environment',      '',     '',     '',        '',     NULL,   NULL),
(236,   'documented_statement_of_faith_or_constitution',        '',     '',     '',     '',     NULL,   NULL),
(237,   'evidence_of_operational_evangelism_&_discipleship Programs',     '',     '',     '',     '',     NULL,        NULL),
(238, 'evidence_of_church_&_community_mobilization_methodologies',        '',     '',     '',     '',     NULL,   NULL),
(239,    'no_of_learning_activities_church_has_participated_in',        '',     '',     '',     '',     NULL,   NULL),
(240,   'percentage_of_plans_of_action_implemented',  '',        '',     '',     '',     NULL,   NULL),
(241,   'records_review',      '',     '',     '',     '',        NULL,   NULL),
(242,      'evidence_of_holistic_gospel_ministry_in_the_church',        '',     '',     '',     '',     NULL,   NULL),
(243,   'evidence_of_CY_program_activities',  '',     '',        '',     '',     NULL,   NULL),
(244, 'documented_no._of_congregation_sensitization_meetings_held',        '',     '',     '',     '',     NULL,   NULL),
(245,   'church_activity_program',     '',     '',     '',        '',     NULL,   NULL),
(246,   'evidence_of_good_report_about_the_church',   '',        '',     '',     '',     NULL,   NULL),
(247,   'Interview_&_FGDs_with_influencers/_other_stakeholders',        '',     '',     '',     '',     NULL,   NULL),
(248,   'Interview_&_FGDs_with_influencers',  '',     '',        '',     '',     NULL,   NULL),
(249,   'Interviews',  '',     '',     '',     '',     NULL,        NULL),
(250,   'FGDs_with_influencers',       '',     '',     '',        '',     NULL,   NULL),
(251,   'Lead Bio Fields Name',        '',     '',     '',        '',     NULL,   NULL),
(252,   'Datatype Name',       '',     '',     '',     '',        NULL,   NULL),
(253,   'Is Field Unique',     '',     '',     '',     '',        NULL,   NULL),
(254,   'Is Field Null',       '',     '',     '',     '',        NULL,   NULL),
(255,   'Is Suspended', '',     '',     '',     '',     NULL,        NULL),
(256,   'Lead Test',   '',     '',     '',     '',     NULL,        NULL),
(257,   'select',      '',     '',     '',     '',     NULL,        NULL),
(258,   'add_row',     '',     '',     '',     '',     NULL,        NULL),
(259,   'remove_row',  '',     '',     '',     '',     NULL,        NULL),
(260,   'reset',       '',     '',     '',     '',     NULL,        NULL),
(261,   'Lead Fax No', '',     '',     '',     '',     NULL,        NULL),
(262,   'Chi Test',    '',     '',     '',     '',     NULL,        NULL),
(263,   'leads_bio_fields',    '',     '',     '',     '',        NULL,   NULL);

CREATE TABLE `leads_bio_information` (
  `leads_bio_information_id` int(100) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(100) NOT NULL DEFAULT '1' COMMENT '1=initial assessment',
  `lead_status` varchar(8) NOT NULL DEFAULT 'Active' COMMENT 'Active=lead is live; Closed=Lead converted or closed',
  `lead_name` longtext,
  `address` longtext,
  `email` longtext,
  `phone` longtext,
  `lead_contact` varchar(30) DEFAULT NULL,
  `lead_fax_no` int(3) DEFAULT NULL,
  `connnect_leadid` varchar(30) DEFAULT NULL,
  `chi_test` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`leads_bio_information_id`),
  KEY `assessment_id` (`assessment_id`),
  CONSTRAINT `leads_bio_information_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessment` (`assessment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `leads_bio_information` (`leads_bio_information_id`, `assessment_id`, `lead_status`, `lead_name`, `address`, `email`, `phone`, `lead_contact`, `lead_fax_no`, `connnect_leadid`, `chi_test`) VALUES
(1,     1,      'Active',      'PCEA Kamanguttt',        'Ngong233',    'pcea@gmail.com',      '098788788',        NULL,   NULL,   NULL,   NULL),
(4,     1,      'Active',      'tets', 'Tets', 'Thethet',        'Thethet',     NULL,   NULL,   NULL,   NULL),
(5,     1,      'Closed',      'Test', 'MMM\r\n',     'e',        'd',    NULL,   NULL,   NULL,   NULL),
(6,     1,      'Active',      'Tets56',      'Tets56',        'Tets56',      'Tets56',      NULL,   NULL,   NULL,        NULL),
(7,     1,      'Active',      'Jimba PEFA',  'Watamu',        'jpefa@gmail.com',     '22323',       '',     0,        NULL,   NULL);

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
  CONSTRAINT `lead_bio_fields_ibfk_1` FOREIGN KEY (`datatype_id`) REFERENCES `datatype` (`datatype_id`),
  CONSTRAINT `lead_bio_fields_ibfk_2` FOREIGN KEY (`datatype_id`) REFERENCES `datatype` (`datatype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `lead_bio_fields` (`lead_bio_fields_id`, `lead_bio_fields_name`, `lead_bio_info_column`, `datatype_id`, `is_field_unique`, `is_field_null`, `default_value`, `show_field`, `is_suspended`) VALUES
(6,     'Lead Name',   'lead_name',   1,      0,      0,        '',     1,      1),
(7,     'Address',     'address',     2,      0,      0,        '',     1,      1),
(8,     'Email',       'email',       2,      0,      0,        '',     1,      1),
(9,     'Phone',       'phone',       1,      0,      0,        '',     1,      1),
(27,    'Lead Location',       'lead_location',       1,        0,      0,      '',     0,      1),
(36,    'Lead Fax No', 'lead_fax_no', 2,      0,      0,        '',     0,      0),
(37,    'Lead Contact', 'lead_contact', 1,      0,      0,        '',     1,      1),
(39,    'Connnect LeadID',     'connnect_leadID',     1,        0,      0,      '',     1,      1),
(41,    'Chi Test',    'chi_test',    1,      0,      0,        '',     0,      0);

CREATE TABLE `profile` (
  `profile_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `assignable` tinyint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `profile` (`profile_id`, `name`, `description`, `assignable`) VALUES
(1,     'Assessor',    '',     1),
(2,     'Manager ',    'Manager',     0);

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
(1,     'PF',   1,      1,      '2019-04-30 07:42:26',        '2019-04-30 04:42:26');

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`settings_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1,     'system_name', 'Prepartnership Assessment Tool'),
(2,     'system_title', 'Prepartnership Assessment'),
(3,     'address',     '1945 Nairobi'),
(4,     'phone',       '254711808071'),
(7,     'system_email', 'support@compassionkenya.com'),
(8,     'active_sms_service',  'disabled'),
(9,     'language',    'english'),
(10,    'text_align',  'left-to-right'),
(11,    'clickatell_user',     ''),
(12,    'clickatell_password', ''),
(13,    'clickatell_api_id',   ''),
(14,    'skin_colour', 'blue'),
(15,    'twilio_account_sid',  ''),
(16,    'twilio_auth_token',   ''),
(17,    'twilio_sender_phone_number',  ''),
(18,    'sidebar-collapsed',   'no');

CREATE TABLE `test_default_field` (
  `test_default_field_id` int(100) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`test_default_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
(1,     'Livingstone', 'Onduso',      'londuso@ke.ci.org',        1,      'fbdf9989ea636d6b339fd6b85f63e06e',        'Male', '0723305687',  1,      1,      1,      0,        1,      1,      '2019-04-30',  '2019-04-30 08:03:17');

CREATE TABLE `yes_no_option` (
  `yes_no_option_id` int(5) NOT NULL AUTO_INCREMENT,
  `yes_no_option_key` int(5) NOT NULL,
  `yes_no_option_name` varchar(10) NOT NULL,
  PRIMARY KEY (`yes_no_option_id`),
  UNIQUE KEY `yes_no_option_key` (`yes_no_option_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `yes_no_option` (`yes_no_option_id`, `yes_no_option_key`, `yes_no_option_name`) VALUES
(1,     0,      'No'),
(2,     1,      'Yes');

-- 2019-06-10 13:48:04

