<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends MY_Controller
{

    function __construct() {
        parent::__construct();
		 $this->load->admin_model('main_model');
        $this->load->library('form_validation');
		$this->load->library('upload');
       $this->image_types = 'gif|jpg|png|jpeg|pdf';
		//$this->photo_types = 'jpg|jpeg';
		//$this->pdf_types = 'pdf';
		$this->photo_types = 'gif|jpg|png|jpeg|pdf';
		$this->pdf_types = 'gif|jpg|png|jpeg|pdf';
		$this->allowed_file_size = '1024';
		$this->upload_path = 'assets/';
		$this->image_path = base_url('assets/');
    }

	
	function index() {
        $this->load->view($this->theme . 'index', $this->data);
    }
	
	function aboutus() {
        $this->load->view($this->theme . 'aboutus', $this->data);
    }
	
	function faq() {
        $this->load->view($this->theme . 'faq', $this->data);
    }
	function contact() {
        $this->load->view($this->theme . 'contact', $this->data);
    }
	function terms_conditions() {
        $this->load->view($this->theme . 'terms_conditions', $this->data);
    }	
	
	function login() {
        admin_redirect('login');
    }

	function privacy_policy() {
        $this->load->view($this->theme . 'privacy_policy', $this->data);
    }
	
	function angkortips() {
        $this->load->view($this->theme . 'angkortips', $this->data);
    }
	function booking_condition() {
        $this->load->view($this->theme . 'booking_condition', $this->data);
    }

}
