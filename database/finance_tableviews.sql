-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP VIEW IF EXISTS `view_book_bank_balance`;
CREATE TABLE `view_book_bank_balance` (`book_bank_balance_id` int(100), `closure_date` date, `fcp_id` varchar(6), `account_type` varchar(10), `balance_amount` decimal(10,2));


DROP VIEW IF EXISTS `view_funds_statement_balance`;
CREATE TABLE `view_funds_statement_balance` (`funds_statement_balance` int(11), `closure_date` date, `statement_date` date, `fcp_id` varchar(6), `statement_amount` decimal(10,2), `submission_date` timestamp);


DROP VIEW IF EXISTS `view_opening_funds_balance`;
CREATE TABLE `view_opening_funds_balance` (`opening_funds_balance_id` int(100), `fcp_id` varchar(6), `total_fund_balance` decimal(10,2), `closure_date` date, `allow_fcp_edit_balance` int(1), `submitted` int(1), `system_opening_balance` int(1), `submission_date` timestamp);


DROP VIEW IF EXISTS `view_voucher_with_deposit_deposit_in_transit`;
CREATE TABLE `view_voucher_with_deposit_deposit_in_transit` (`voucher_id` int(100) unsigned, `fcp_id` varchar(6), `voucher_raised_date` date, `financial_year` int(2), `voucher_number` int(6), `payee` varchar(200), `payee_address` varchar(200), `voucher_type` varchar(50), `cheque_number` varchar(10), `clearance_state` int(5), `clearance_date` date, `allow_fcp_edit` int(5), `voucher_description` text, `deposit_in_transit_amount` decimal(10,2), `voucher_edit_request_id` int(100), `last_modified_date` timestamp);


DROP VIEW IF EXISTS `view_voucher_with_oustanding_cheques`;
CREATE TABLE `view_voucher_with_oustanding_cheques` (`voucher_id` int(100) unsigned, `fcp_id` varchar(6), `voucher_raised_date` date, `financial_year` int(2), `voucher_number` int(6), `payee` varchar(200), `payee_address` varchar(200), `voucher_type` varchar(50), `cheque_number` varchar(10), `clearance_state` int(5), `clearance_date` date, `allow_fcp_edit` int(5), `voucher_description` text, `outstanding_cheque_amount` decimal(10,2), `voucher_edit_request_id` int(100), `last_modified_date` timestamp);


DROP TABLE IF EXISTS `view_book_bank_balance`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_book_bank_balance` AS select `finance_cashbal`.`balID` AS `book_bank_balance_id`,`finance_cashbal`.`month` AS `closure_date`,`finance_cashbal`.`icpNo` AS `fcp_id`,`finance_cashbal`.`accNo` AS `account_type`,`finance_cashbal`.`amount` AS `balance_amount` from `finance_cashbal` where (`finance_cashbal`.`accNo` = 'BC');

DROP TABLE IF EXISTS `view_funds_statement_balance`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_funds_statement_balance` AS select `finance_statementbal`.`balID` AS `funds_statement_balance`,`finance_statementbal`.`month` AS `closure_date`,`finance_statementbal`.`statementDate` AS `statement_date`,`finance_statementbal`.`icpNo` AS `fcp_id`,`finance_statementbal`.`amount` AS `statement_amount`,`finance_statementbal`.`stmp` AS `submission_date` from `finance_statementbal`;

DROP TABLE IF EXISTS `view_opening_funds_balance`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_opening_funds_balance` AS select `finance_opfundsbalheader`.`balHdID` AS `opening_funds_balance_id`,`finance_opfundsbalheader`.`icpNo` AS `fcp_id`,`finance_opfundsbalheader`.`totalBal` AS `total_fund_balance`,`finance_opfundsbalheader`.`closureDate` AS `closure_date`,`finance_opfundsbalheader`.`allowEdit` AS `allow_fcp_edit_balance`,`finance_opfundsbalheader`.`submitted` AS `submitted`,`finance_opfundsbalheader`.`systemOpening` AS `system_opening_balance`,`finance_opfundsbalheader`.`stmp` AS `submission_date` from `finance_opfundsbalheader`;

DROP TABLE IF EXISTS `view_voucher_with_deposit_deposit_in_transit`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_voucher_with_deposit_deposit_in_transit` AS select `finance_voucher_header`.`hID` AS `voucher_id`,`finance_voucher_header`.`icpNo` AS `fcp_id`,`finance_voucher_header`.`TDate` AS `voucher_raised_date`,`finance_voucher_header`.`Fy` AS `financial_year`,`finance_voucher_header`.`VNumber` AS `voucher_number`,`finance_voucher_header`.`Payee` AS `payee`,`finance_voucher_header`.`Address` AS `payee_address`,`finance_voucher_header`.`VType` AS `voucher_type`,`finance_voucher_header`.`ChqNo` AS `cheque_number`,`finance_voucher_header`.`ChqState` AS `clearance_state`,`finance_voucher_header`.`clrMonth` AS `clearance_date`,`finance_voucher_header`.`editable` AS `allow_fcp_edit`,`finance_voucher_header`.`TDescription` AS `voucher_description`,`finance_voucher_header`.`totals` AS `deposit_in_transit_amount`,`finance_voucher_header`.`reqID` AS `voucher_edit_request_id`,`finance_voucher_header`.`tmStmp` AS `last_modified_date` from `finance_voucher_header` where (`finance_voucher_header`.`VType` = 'CR');

DROP TABLE IF EXISTS `view_voucher_with_oustanding_cheques`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_voucher_with_oustanding_cheques` AS select `finance_voucher_header`.`hID` AS `voucher_id`,`finance_voucher_header`.`icpNo` AS `fcp_id`,`finance_voucher_header`.`TDate` AS `voucher_raised_date`,`finance_voucher_header`.`Fy` AS `financial_year`,`finance_voucher_header`.`VNumber` AS `voucher_number`,`finance_voucher_header`.`Payee` AS `payee`,`finance_voucher_header`.`Address` AS `payee_address`,`finance_voucher_header`.`VType` AS `voucher_type`,`finance_voucher_header`.`ChqNo` AS `cheque_number`,`finance_voucher_header`.`ChqState` AS `clearance_state`,`finance_voucher_header`.`clrMonth` AS `clearance_date`,`finance_voucher_header`.`editable` AS `allow_fcp_edit`,`finance_voucher_header`.`TDescription` AS `voucher_description`,`finance_voucher_header`.`totals` AS `outstanding_cheque_amount`,`finance_voucher_header`.`reqID` AS `voucher_edit_request_id`,`finance_voucher_header`.`tmStmp` AS `last_modified_date` from `finance_voucher_header` where (`finance_voucher_header`.`VType` = 'CHQ');

-- 2019-06-25 20:06:38