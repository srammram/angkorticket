<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Customer_api extends CI_Model
{
	public $tables = array();
	protected $_ion_hooks;
	var $limit;
	public function __construct() {
	    parent::__construct();
	    $this->load->config('ion_auth', TRUE);
	    $this->limit = 10;
	}
	
}
