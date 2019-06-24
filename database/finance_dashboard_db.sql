-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `finance_cashbal`;
CREATE TABLE `finance_cashbal` (
  `balID` int(100) NOT NULL AUTO_INCREMENT,
  `month` date NOT NULL,
  `icpNo` varchar(6) NOT NULL,
  `accNo` varchar(5) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `stmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`balID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `finance_cashbal` (`balID`, `month`, `icpNo`, `accNo`, `amount`, `stmp`) VALUES
(1,	'2019-03-31',	'KE0200',	'BC',	121560.21,	'2019-06-22 05:57:49'),
(2,	'2019-03-31',	'KE0200',	'PC',	4510.00,	'2019-06-22 05:57:49'),
(3,	'2019-03-31',	'KE0320',	'BC',	323654.87,	'2019-06-22 05:57:49'),
(4,	'2019-03-31',	'KE0320',	'PC',	7629.00,	'2019-06-22 05:57:49'),
(5,	'2019-03-31',	'KE0678',	'BC',	5549801.45,	'2019-06-22 05:57:49'),
(6,	'2019-03-31',	'KE0678',	'PC',	12310.00,	'2019-06-22 05:57:49');

DROP TABLE IF EXISTS `finance_dashboard_parameter`;
CREATE TABLE `finance_dashboard_parameter` (
  `dashboard_parameter_id` int(100) NOT NULL AUTO_INCREMENT,
  `dashboard_parameter_name` longtext NOT NULL,
  `result_method` varchar(100) NOT NULL COMMENT 'this is a method to be used by ''user_func_method''',
  `is_requested` varchar(5) NOT NULL DEFAULT 'no' COMMENT '''no'' means parameter is not requested and ''yes'' means parameter needs to be requested',
  `display_on_dashboard` varchar(5) NOT NULL DEFAULT 'yes' COMMENT '''yes'' means display on dashboard. ''no'' means don''t display on dashboard',
  PRIMARY KEY (`dashboard_parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `finance_dashboard_parameter` (`dashboard_parameter_id`, `dashboard_parameter_name`, `result_method`, `is_requested`, `display_on_dashboard`) VALUES
(1,	'MFR Submitted',	'callback_mfr_submitted',	'no',	'yes'),
(2,	'Bank Statement uploaded',	'callback_bank_statement_uploaded',	'no',	'yes'),
(3,	'Book Bank Balance',	'callback_book_bank_balance',	'no',	'yes'),
(4,	'Statement Bank Balance',	'callback_statement_bank_balance',	'no',	'no'),
(5,	'Outstanding Cheques',	'callback_outstanding_cheques',	'no',	'no'),
(6,	'Deposit in transit',	'callback_deposit_in_transit',	'no',	'no'),
(7,	'Bank Reconciliation',	'callback_bank_reconcile_correct',	'no',	'yes');

DROP TABLE IF EXISTS `finance_opfundsbalheader`;
CREATE TABLE `finance_opfundsbalheader` (
  `balHdID` int(100) NOT NULL AUTO_INCREMENT,
  `icpNo` varchar(6) NOT NULL,
  `totalBal` decimal(10,2) NOT NULL,
  `closureDate` date NOT NULL,
  `allowEdit` int(5) NOT NULL DEFAULT '1',
  `submitted` int(5) NOT NULL DEFAULT '0',
  `systemOpening` int(5) NOT NULL DEFAULT '0',
  `stmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`balHdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `finance_opfundsbalheader` (`balHdID`, `icpNo`, `totalBal`, `closureDate`, `allowEdit`, `submitted`, `systemOpening`, `stmp`) VALUES
(1,	'KE0320',	231675.45,	'2019-03-31',	0,	1,	0,	'2019-06-22 05:44:13'),
(2,	'KE0678',	5628716.21,	'2019-03-31',	0,	1,	0,	'2019-06-22 05:44:13'),
(3,	'KE0200',	8745637.34,	'2019-03-31',	0,	1,	0,	'2019-06-22 05:44:13');

DROP TABLE IF EXISTS `finance_projectsdetails`;
CREATE TABLE `finance_projectsdetails` (
  `ID` int(100) NOT NULL AUTO_INCREMENT,
  `icpNo` varchar(6) NOT NULL,
  `icpName` varchar(100) NOT NULL,
  `clusters_id` int(100) NOT NULL,
  `bankID` int(100) NOT NULL,
  `system_start_date` date NOT NULL,
  `status` int(5) NOT NULL,
  `risk` varchar(10) NOT NULL DEFAULT 'Low' COMMENT 'High, Medium , Low',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `finance_projectsdetails` (`ID`, `icpNo`, `icpName`, `clusters_id`, `bankID`, `system_start_date`, `status`, `risk`) VALUES
(1,	'KE0200',	'Rongai CDC',	1,	1,	'2019-01-01',	1,	'Low'),
(2,	'KE0245',	'Emuhaya CDC',	1,	1,	'2019-01-01',	1,	'High'),
(3,	'KE0320',	'Light HouseCDC',	1,	1,	'2019-01-01',	1,	'High'),
(4,	'KE0640',	'Meru CDC',	1,	1,	'2019-01-01',	1,	'High'),
(5,	'KE0678',	'Ruaka CDC',	1,	1,	'2019-01-01',	1,	'Medium');

DROP TABLE IF EXISTS `finance_statementbal`;
CREATE TABLE `finance_statementbal` (
  `balID` int(100) NOT NULL AUTO_INCREMENT,
  `statementDate` date NOT NULL COMMENT 'statementDate: The date which you picked and entered statement balance',
  `month` date NOT NULL COMMENT 'month: which month is the mfr you submitting',
  `actualDate` date NOT NULL COMMENT 'actualDate is the the date you entered the statement balance',
  `icpNo` varchar(6) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `stmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`balID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `finance_statementbal` (`balID`, `statementDate`, `month`, `actualDate`, `icpNo`, `amount`, `stmp`) VALUES
(1,	'2019-03-31',	'2019-03-31',	'2019-03-31',	'KE0200',	161560.21,	'2019-06-23 15:24:33'),
(2,	'2019-03-31',	'2019-03-31',	'2019-03-31',	'KE0320',	243987.55,	'2019-06-22 06:01:20'),
(3,	'2019-03-31',	'2019-03-31',	'2019-03-31',	'KE0678',	126576.10,	'2019-06-22 06:01:20');

DROP TABLE IF EXISTS `finance_voucher_header`;
CREATE TABLE `finance_voucher_header` (
  `hID` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `icpNo` varchar(6) NOT NULL,
  `TDate` date NOT NULL,
  `Fy` int(2) NOT NULL,
  `VNumber` int(6) NOT NULL,
  `Payee` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `VType` varchar(50) NOT NULL,
  `ChqNo` varchar(10) DEFAULT NULL,
  `ChqState` int(5) NOT NULL,
  `clrMonth` date NOT NULL,
  `editable` int(5) NOT NULL DEFAULT '0',
  `TDescription` text NOT NULL,
  `totals` decimal(10,2) NOT NULL,
  `reqID` int(100) NOT NULL DEFAULT '0',
  `unixStmp` int(100) NOT NULL,
  `tmStmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`hID`),
  KEY `TDate` (`TDate`),
  KEY `icpNo` (`icpNo`),
  KEY `Fy` (`Fy`),
  KEY `VType` (`VType`),
  KEY `VNumber` (`VNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `finance_voucher_header` (`hID`, `icpNo`, `TDate`, `Fy`, `VNumber`, `Payee`, `Address`, `VType`, `ChqNo`, `ChqState`, `clrMonth`, `editable`, `TDescription`, `totals`, `reqID`, `unixStmp`, `tmStmp`) VALUES
(22,	'KE0200',	'2019-03-10',	19,	190301,	'Test',	'Test',	'CHQ',	'0',	0,	'0000-00-00',	0,	'',	15000.00,	0,	0,	'2019-06-23 15:04:10'),
(24,	'KE0200',	'2019-02-10',	19,	190301,	'Test',	'Test',	'CHQ',	'0',	0,	'0000-00-00',	0,	'',	15000.00,	0,	0,	'2019-06-23 15:04:10'),
(25,	'KE0200',	'2019-03-10',	19,	190301,	'Test',	'Test',	'CHQ',	'0',	1,	'2019-04-30',	0,	'',	15000.00,	0,	0,	'2019-06-23 15:04:10'),
(26,	'KE0200',	'2019-02-10',	19,	190301,	'Test',	'Test',	'CHQ',	'0',	1,	'2019-05-31',	0,	'',	15000.00,	0,	0,	'2019-06-23 15:04:10'),
(27,	'KE0320',	'2019-03-10',	19,	190301,	'Test',	'Test',	'CHQ',	'0',	0,	'0000-00-00',	0,	'',	10000.00,	0,	0,	'2019-06-23 15:12:38'),
(28,	'KE0320',	'2019-02-10',	19,	190301,	'Test',	'Test',	'CHQ',	'0',	0,	'0000-00-00',	0,	'',	10000.00,	0,	0,	'2019-06-23 15:12:38'),
(29,	'KE0320',	'2019-03-10',	19,	190301,	'Test',	'Test',	'CHQ',	'0',	1,	'2019-04-30',	0,	'',	10000.00,	0,	0,	'2019-06-23 15:12:38'),
(30,	'KE0320',	'2019-02-10',	19,	190301,	'Test',	'Test',	'CHQ',	'0',	1,	'2019-05-31',	0,	'',	10000.00,	0,	0,	'2019-06-23 15:12:38'),
(34,	'KE0678',	'2019-03-10',	19,	190301,	'Test',	'Test',	'CR',	'0',	0,	'0000-00-00',	0,	'',	15000.00,	0,	0,	'2019-06-23 15:04:10'),
(35,	'KE0678',	'2019-02-10',	19,	190301,	'Test',	'Test',	'CR',	'0',	0,	'0000-00-00',	0,	'',	15000.00,	0,	0,	'2019-06-23 15:04:10'),
(36,	'KE0678',	'2019-03-10',	19,	190301,	'Test',	'Test',	'CR',	'0',	1,	'2019-04-30',	0,	'',	15000.00,	0,	0,	'2019-06-23 15:04:10'),
(37,	'KE0678',	'2019-02-10',	19,	190301,	'Test',	'Test',	'CR',	'0',	1,	'2019-05-31',	0,	'',	15000.00,	0,	0,	'2019-06-23 15:04:10'),
(41,	'KE0200',	'2019-03-10',	19,	190301,	'Test',	'Test',	'CR',	'0',	0,	'0000-00-00',	0,	'',	5000.00,	0,	0,	'2019-06-23 15:04:10'),
(42,	'KE0200',	'2019-02-10',	19,	190301,	'Test',	'Test',	'CR',	'0',	0,	'0000-00-00',	0,	'',	5000.00,	0,	0,	'2019-06-23 15:04:10'),
(43,	'KE0200',	'2019-03-10',	19,	190301,	'Test',	'Test',	'CR',	'0',	1,	'2019-04-30',	0,	'',	5000.00,	0,	0,	'2019-06-23 15:04:10'),
(44,	'KE0200',	'2019-02-10',	19,	190301,	'Test',	'Test',	'CR',	'0',	1,	'2019-05-31',	0,	'',	5000.00,	0,	0,	'2019-06-23 15:04:10');

-- 2019-06-24 06:20:44
