<?php defined('BASEPATH') OR exit('No direct script access allowed');
class People extends MY_Controller
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
		$this->load->library('firebase');
		$this->load->library('push');
		$this->load->helper('string');
		$this->load->helper(array('form', 'url'));
		$this->photo_types = 'gif|jpg|png|jpeg|pdf';
		$this->pdf_types = 'gif|jpg|png|jpeg|pdf';
		$this->load->library('upload');
        $this->image_types = 'gif|jpg|png|jpeg|pdf';		
		$this->allowed_file_size = '1024';
		$this->upload_path = 'assets/';
		$this->image_path = base_url('assets/');
		$this->load->admin_model('people_model');
		$this->load->admin_model('users_model');
		
    }
	
	
	public function sms_user($sms_message, $sms_phone, $sms_country_code) {

        $sms_chk_arr = array('[SMSMESSAGE]');
        $sms_rep_arr = array($sms_message);
        $response_sms = send_transaction_sms($sms_template_slug = "user", $sms_chk_arr, $sms_rep_arr, $sms_phone, $sms_country_code);
        return $response_sms;
    }
	
	
	/*###### Customer*/
    function customer($action=false){
		
		$this->site->users_logs($this->session->userdata('user_id'), $this->getUserIpAddr, json_encode($_POST), $_SERVER['REQUEST_URI']);
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('customer')));
        $meta = array('page_title' => lang('customer'), 'bc' => $bc);
        $this->page_construct('people/customer', $meta, $this->data);
    }
    function getCustomer(){
		
		$sdate = $_GET['sdate'];
		$edate = $_GET['edate'];
		$approved = $_GET['approved'];
		
        $this->load->library('datatables');
        $this->datatables
            ->select("{$this->db->dbprefix('users')}.id as id, {$this->db->dbprefix('users')}.created_on, {$this->db->dbprefix('users')}.first_name, {$this->db->dbprefix('users')}.last_name, {$this->db->dbprefix('users')}.email, {$this->db->dbprefix('users')}.mobile,  {$this->db->dbprefix('users')}.gender, {$this->db->dbprefix('users')}.dob")
            ->from("users")
			->where("users.group_id", 3);
			
			if(!empty($sdate) && !empty($edate)){
				$this->datatables->where("DATE({$this->db->dbprefix('users')}.created_on) >=", date("Y-m-d", strtotime(str_replace('/', '-', $sdate))));
       			$this->datatables->where("DATE({$this->db->dbprefix('users')}.created_on) <=", date("Y-m-d", strtotime(str_replace('/', '-', $edate))));
			}
			
			$this->datatables->where('users.is_delete', 0);
			
			$edit = "<a href='" . admin_url('people/customer_view/$1') . "' data-toggle='tooltip'  data-original-title='' aria-describedby='tooltip' title='".lang('click_here_to_full_details')."'  ><i class='fa fa-eye' aria-hidden='true'  style='color:#656464; font-size:18px'></i></a>";
			$delete = "<a href='" . admin_url('welcome/delete/users/$1') . "' data-toggle='tooltip'  data-original-title='' aria-describedby='tooltip' title='".lang('click_here_to_delete')."'  ><i class='fa fa-trash' style='color:#656464; font-size:18px'></i></a>";
			
			$this->datatables->add_column("Actions", "<div>".$edit."</div><div>".$delete."</div>", "id");
			
			$this->datatables->unset_column('id');
	   		echo $this->datatables->generate();
    }
	
	function add_customer(){
		$current_date = date('Y-m-d');
		
		$this->site->users_logs($this->session->userdata('user_id'), $this->getUserIpAddr, json_encode($_POST), $_SERVER['REQUEST_URI']);
        $this->form_validation->set_rules('mobile', lang("mobile_number"), 'required');  
		$this->form_validation->set_rules('first_name', lang("first_name"), 'required');
		$this->form_validation->set_rules('gender', lang("gender"), 'required');
		
        if ($this->form_validation->run() == true) {
			
			
			$check_email = $this->people_model->checkEmailcustomer($this->input->post('email'));
			if($check_email == 1){
				$this->session->set_flashdata('error', lang("email_number_already_exits"));
           		admin_redirect('people/add_customer');
			}
						
           $oauth_token = get_random_key(32,'users','oauth_token',$type='alnum');
		   $country = $this->site->getCountryName($this->input->post('country_code'));
		   
		   $user = array(
		   		'oauth_token' => $oauth_token,
				'username' => 'CUS'.date('YmdHis'),
				'devices_imei' => 'first_time',
				'email' => $this->input->post('email'),
				'first_name' => $this->input->post('first_name'),
				'last_name' => $this->input->post('last_name'),
				'gender' => $this->input->post('gender'),
				'dob' => $this->input->post('dob'),
				'password' => md5($this->input->post('password')),
				'text_password' => $this->input->post('password'),
				'country_code' => $this->input->post('country_code'),
				'mobile' => $this->input->post('mobile'),
				'created_by' => $this->session->userdata('user_id'),
				'created_on' => date('y-m-d H:i:s'),
				'group_id' => 3,
				'is_edit' => 1,
				'complete_user' => 1,
				'active' => 1,
				'is_approved' => 1,
				'country' => $country,
		   );
		   
		   
		   
		   if ($_FILES['photo']['size'] > 0) {
				$config['upload_path'] = $this->upload_path.'users/';
				$config['allowed_types'] = $this->photo_types;
				$config['overwrite'] = FALSE;
				$config['max_filename'] = 25;
				$config['encrypt_name'] = TRUE;
				$this->upload->initialize($config);
				if (!$this->upload->do_upload('photo')) {
					$result = array( 'status'=> false , 'message'=> lang('image_not_uploaded'));
				}
				$photo = $this->upload->file_name;
				$user['photo'] = 'users/'.$photo;
				$config = NULL;
			}
			
			
			//$this->sma->print_arrays($user);
			//die;
        }
		
        if ($this->form_validation->run() == true && $this->people_model->add_customer($user)){
			
			//$sms_message = $this->input->post('first_name').' your account has been register successfully.Your refer code : '.$refer_code.'';
			//$sms_phone = $this->input->post('country_code').$this->input->post('mobile');
			//$sms_country_code = $this->input->post('country_code');
			//$response_sms = $this->sms_user($sms_message, $sms_phone, $sms_country_code);
            $this->session->set_flashdata('message', lang("customer_added"));
            admin_redirect('people/customer');
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('people/customer'), 'page' => lang('customer')), array('link' => '#', 'page' => lang('add_customer')));
            $meta = array('page_title' => lang('add_customer'), 'bc' => $bc);
			$this->data['countrys']	= $this->site->getCountry();
            $this->page_construct('people/add_customer', $meta, $this->data);
        }        
    }
	
	function status($status,$id){
		
		$this->site->users_logs($this->session->userdata('user_id'), $this->getUserIpAddr, json_encode($_POST), $_SERVER['REQUEST_URI']);
        $data['status'] = 0;
        if($status=='active'){
            $data['status'] = 1;
        }
		$notification['title'] = 'Admin Account Change Status';
		$notification['message'] = ' admin has been '.$status.' account.';
		$notification['user_type'] = 1;
		$notification['user_id'] = $id;
		$this->site->insertNotification($notification);
        $this->people_model->update_status($data,$id, $countryCode);
		redirect($_SERVER["HTTP_REFERER"]);
    }
	
	function customer_view($id){
		
		$this->site->users_logs($this->session->userdata('user_id'), $this->getUserIpAddr, json_encode($_POST), $_SERVER['REQUEST_URI']);
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['id'] = $id;
		$this->data['user'] = $this->users_model->getUser($id);
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('customer')));
        $meta = array('page_title' => lang('customer'), 'bc' => $bc);
        $this->page_construct('people/customer_view', $meta, $this->data);
    }
	
	
}
