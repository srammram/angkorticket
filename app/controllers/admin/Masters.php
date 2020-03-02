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
		$this->form_validation->set_rules('site_name', lang('site_name'), 'trim|required');
		if ($this->form_validation->run() == true) {
			$data = array(
				'site_name' => $this->input->post('site_name'),
				'timezone' => $this->input->post('timezone'),
				'adult_price' => $this->input->post('adult_price'),
				'child_price' => $this->input->post('child_price'),
				'child_age_limit' => $this->input->post('child_age_limit'),
			);
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
			$this->data['dataSettings'] = $this->site->get_setting();
			$this->page_construct('masters/index', $meta, $this->data);

		}
		
	}
	
	/*###### package*/
    function package($action = NULL)
    {
		
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('package')));
        $meta = array('page_title' => lang('package'), 'bc' => $bc);
        $this->page_construct('masters/package', $meta, $this->data);
    }
    function getPackage(){
		
        $this->load->library('datatables');
        $this->datatables
            ->select("{$this->db->dbprefix('package')}.id as id, {$this->db->dbprefix('package')}.name,{$this->db->dbprefix('package')}.days,{$this->db->dbprefix('package')}.price, {$this->db->dbprefix('package')}.status as status")
            ->from("package")
			->where('package.is_delete', 0);
			
            $this->datatables->edit_column('status', '$1__$2', 'status, id');
			
			$edit = "<a href='" . admin_url('masters/edit_package/$1') . "' data-toggle='tooltip'  data-original-title='' aria-describedby='tooltip' title='".lang('click_here_to_full_details')."'  ><i class='fa fa-pencil-square-o' aria-hidden='true'  style='color:#656464; font-size:18px'></i></a>";
			$delete = "<a href='" . admin_url('welcome/delete/package/$1') . "' data-toggle='tooltip'  data-original-title='' aria-describedby='tooltip' title='".lang('click_here_to_delete')."'  ><i class='fa fa-trash' style='color:#656464; font-size:18px'></i></a>";
			
			$this->datatables->add_column("Actions", "<div>".$edit."</div><div>".$delete."</div>", "id");

        $this->datatables->unset_column('id');
        echo $this->datatables->generate();
    }
	
	
    function add_package(){
		
        $this->form_validation->set_rules('name', lang("name"), 'required|is_unique[package.name]');
		$this->form_validation->set_rules('days', lang("days"), 'required');
		$this->form_validation->set_rules('price', lang("price"), 'required');
     
        if ($this->form_validation->run() == true) {
			
            $data = array(
				'created_on' => date('Y-m-d H:i:s'),
				'name' => $this->input->post('name'),
                'days' => $this->input->post('days'),
				'price' => $this->input->post('price'),
				'created_by' => $this->session->userdata('user_id'),
                'status' => 1,
            );
			
        }elseif ($this->input->post('add_package')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect("masters/package");
        }
		
        if ($this->form_validation->run() == true && $this->masters_model->add_package($data)){
			
            $this->session->set_flashdata('message', lang("package_added"));
            admin_redirect('masters/package');
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('masters/package'), 'page' => lang('package')), array('link' => '#', 'page' => lang('add_package')));
            $meta = array('page_title' => lang('add_package'), 'bc' => $bc);
            $this->page_construct('masters/add_package', $meta, $this->data);
        }
    }
    function edit_package($id){
		$result = $this->masters_model->getPackageby_ID($id);
		
        $this->form_validation->set_rules('name', lang("name"), 'required');
		if($result->name != $this->input->post('name')){
			$this->form_validation->set_rules('name', lang("name"), 'is_unique[package.name]');
		}
		$this->form_validation->set_rules('days', lang("days"), 'required');
		$this->form_validation->set_rules('price', lang("price"), 'required');
				
        if ($this->form_validation->run() == true) {
			
            $data = array(
				'created_on' => date('Y-m-d H:i:s'),
				'name' => $this->input->post('name'),
                'days' => $this->input->post('days'),
				'price' => $this->input->post('price'),
				'created_by' => $this->session->userdata('user_id'),
            );
			
        }
		
		
        if ($this->form_validation->run() == true && $this->masters_model->update_package($id,$data)){
			
            $this->session->set_flashdata('message', lang("package_updated"));
            admin_redirect('masters/package');
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('masters/package'), 'page' => lang('package')), array('link' => '#', 'page' => lang('package')));
            $meta = array('page_title' => lang('edit_package'), 'bc' => $bc);
            $this->data['package'] = $result;
			$this->data['id'] = $id;
            $this->page_construct('masters/edit_package', $meta, $this->data);
        }
    }
    function package_status($status,$id){
		
		$data['status'] = 0;
		if($status=='activate'){
			$data['status'] = 1;
		}
		$this->masters_model->update_package_status($data,$id);
		redirect($_SERVER["HTTP_REFERER"]);
    }
	
	
}
