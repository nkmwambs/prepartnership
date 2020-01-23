<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Compasion International
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		Africa Dev Team 
 * @copyright	Copyright (c) 2018 - 2019, Compassion.
 * @license		https://www.compassion-africa.org/user_guide/license.html
 * @link		https://www.compassion-africa.org
 * @since		Version 1.0
 * @filesource
 */


if ( ! function_exists('dropdown_range_option'))
{

	function dropdown_range_option($min,$max){
		$ranges = range($min, $max);

		$options = array();

		foreach ($ranges as $range_count) {
			$options[$range_count]['option'] = $range_count;
		}
		
		return $options;
	}
}

if ( ! function_exists('phrases_to_human_readable'))
{

	function phrases_to_human_readable($phrase){
			
		return ucwords(str_replace('_',' ',$phrase));;
	}
}	