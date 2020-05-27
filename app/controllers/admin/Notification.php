<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Notification extends MY_Controller
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
		$this->upload_path = 'assets/uploads/customers/';
        $this->thumbs_path = 'assets/uploads/customers/thumbs/';
        $this->image_types = 'gif|jpg|png|jpeg|pdf';
		$this->photo_types = 'gif|jpg|png|jpeg|pdf';
		$this->pdf_types = 'gif|jpg|png|jpeg|pdf';
		$this->allowed_file_size = '1024';
		$this->upload_path = 'assets/';
		$this->image_path = base_url('assets/');
		$this->load->admin_model('masters_model');
		$this->load->admin_model('notifications_model');
    }
	

	
	
    function index()
    {
		$this->site->updateNotification();
		$this->site->users_logs($this->session->userdata('user_id'), $this->getUserIpAddr, $this->getUserIpAddr, json_encode($_POST), $_SERVER['REQUEST_URI']);
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
       
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('notification')));
        $meta = array('page_title' => lang('notification'), 'bc' => $bc);
        $this->page_construct('notification/index', $meta, $this->data);
    }
	
    function getNotifications(){
		
		$sdate = $this->input->get('sdate');
		$edate = $this->input->get('edate');
		
        $this->load->library('datatables');
        $this->datatables
            ->select("{$this->db->dbprefix('notification')}.created_on, {$this->db->dbprefix('notification')}.user_type, {$this->db->dbprefix('notification')}.title, {$this->db->dbprefix('notification')}.message ")
            ->from("notification")
			->where("notification.user_type = 0");
			
			
			
			if(!empty($sdate) && !empty($edate)){
				$this->datatables->where("DATE({$this->db->dbprefix('notification')}.created_on) >=", date("Y-m-d", strtotime(str_replace('/', '-', $sdate))));
       			$this->datatables->where("DATE({$this->db->dbprefix('notification')}.created_on) <=", date("Y-m-d", strtotime(str_replace('/', '-', $edate))));
			}

			
        $this->datatables->unset_column('id');
        echo $this->datatables->generate();
		
    }

}
