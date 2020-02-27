<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Masters extends MY_Controller
{

    function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
		$this->lang->admin_load('common', $this->Settings->user_language);
		$this->load->library('form_validation');
		$this->load->library('upload');
        $this->image_types = 'gif|jpg|png|jpeg|pdf';
		$this->photo_types = 'gif|jpg|png|jpeg|pdf';
		$this->pdf_types = 'gif|jpg|png|jpeg|pdf';
		$this->allowed_file_size = '1024';
		$this->upload_path = 'assets/';
		$this->image_path = base_url('assets/');
		$this->load->admin_model('masters_model');
    }
	
	function index(){
		
		$this->site->users_logs($this->session->userdata('user_id'), $this->getUserIpAddr, json_encode($_POST), $_SERVER['REQUEST_URI']);
		//$this->form_validation->set_rules('driver_ride_accept', lang('driver_ride_accept'), 'trim|required');
		$this->form_validation->set_rules('search_kilometer', lang('search_kilometer'), 'trim|required');
		if ($this->form_validation->run() == true) {
			
		}elseif ($this->input->post('update_settings')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect("masters/index");
        }
		
		if ($this->form_validation->run() == true && $this->masters_model->updateSetting($data)) {
			$this->session->set_flashdata('message', lang('setting_updated'));
            admin_redirect("masters/index");
		}else{
			
			$this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
			$this->data['action'] = $action;
			$bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('settings')));
			$meta = array('page_title' => lang('settings'), 'bc' => $bc);
			
			$this->page_construct('masters/index', $meta, $this->data);

		}
		
	}
	
}
