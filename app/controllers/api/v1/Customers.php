<?php defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;


class Customers extends REST_Controller {
	
	function __construct() {
		parent::__construct();
		$this->load->helper(array('form', 'url'));
		$this->load->library('form_validation');
		$this->load->api_model('customer_api');
		$this->load->library('firebase');
		$this->load->library('push');
		$this->load->helper('string');
		$this->load->library('upload');
		$this->getUserIpAddr = $this->site->getUserIpAddr();
        $this->image_types = 'gif|jpg|png|jpeg|pdf'; 
		$this->photo_types = 'gif|jpg|png|jpeg|pdf';
		$this->pdf_types = 'gif|jpg|png|jpeg|pdf';
		$this->allowed_file_size = '1024';
		$this->upload_path = 'assets/';
		$this->image_path = base_url('assets/');
		$this->load->library('socketemitter');
	}	
	
	public function setting_get(){
		$setting = $this->site->get_setting();
		$result = array( 'status'=> true , 'message'=> 'Success', 'per_head_price' => $setting->adult_price);
		$this->response($result);
	}
	
	public function package_get(){
		$package = $this->site->get_package();
		if(!empty($package)){
			$result = array( 'status'=> true , 'message'=> 'Success', 'data' => $package);
		}else{
			$result = array( 'status'=> false , 'message'=> 'no data');
		}
		$this->response($result);
	}
	
	public function country_get(){
		$country = $this->site->getCountry();
		if(!empty($country)){
			$result = array( 'status'=> true , 'message'=> 'Success', 'data' => $country);
		}else{
			$result = array( 'status'=> false , 'message'=> 'no data');
		}
		$this->response($result);
	}
	
	public function check_exist($string,$token){
		if(!empty($string)){
			$column=$token;
			$where = array(
			  $column => $string
			);
			
			$this->db->select('id');
			$this->db->from('users');
			$this->db->where($where);
			$this->db->where('group_id', 3);
			$q = $this->db->get();
			if($q->num_rows()>0){
			  return true;
			}else{
				$this->form_validation->set_message('check_exist', 'The %s value is mismatch.');
			  	return false;
			}
		 }
	}
	
	public function sms_user($sms_message, $sms_phone, $sms_country_code) {

        $sms_chk_arr = array('[SMSMESSAGE]');
        $sms_rep_arr = array($sms_message);
        $response_sms = send_transaction_sms($sms_template_slug = "user", $sms_chk_arr, $sms_rep_arr, $sms_phone, $sms_country_code);
        return $response_sms;
    }
	
	public function sms_user_active($sms_phone_otp, $sms_phone, $sms_country_code) {

        $sms_chk_arr = array('[MOBILE_OTP]');
        $sms_rep_arr = array($sms_phone_otp);
        $response_sms = send_otp_sms($sms_template_slug = "user-mobile-active", $sms_chk_arr, $sms_rep_arr, $sms_phone, $sms_country_code);
        return $response_sms;
    }
	
	public function register_post(){
		$current_date = date('Y-m-d');
		$this->form_validation->set_rules('password', $this->lang->line("password"), 'required');
		$this->form_validation->set_rules('country_code', $this->lang->line("country_code"), 'required');
		$this->form_validation->set_rules('mobile', $this->lang->line("mobile"), 'required');
		$this->form_validation->set_rules('devices_imei', $this->lang->line("devices_imei"), 'required');
		$this->form_validation->set_rules('first_name', $this->lang->line("first_name"), 'required');
		$this->form_validation->set_rules('email', $this->lang->line("email"), 'required');
		if ($this->form_validation->run() == true) {
			
			$mobile_verify = $this->input->post('mobile_verify');
			
			$check_email = $this->customer_api->checkEmail($this->input->post('email'));
			if($check_email == FALSE){
				$oauth_token = get_random_key(32,'users','oauth_token',$type='alnum');
				$mobile_otp = random_string('numeric', 6);
				$check_mobile = $this->customer_api->checkMobile($this->input->post('mobile'), $this->input->post('country_code'));
				
				if($mobile_verify == 0 && $check_mobile == 1){
					$result = array( 'status'=> 0 , 'message'=> 'Mobile number already exit!');	
				}elseif($mobile_verify == 0 && $check_mobile == 0){
					$sms_phone_otp = $mobile_otp;
					$sms_phone = $this->input->post('country_code').$this->input->post('mobile');
					$sms_country_code = $this->input->post('country_code');
					$response_sms = $this->sms_user_active($sms_phone_otp, $sms_phone, $sms_country_code);
					if($response_sms){
						$result = array( 'status'=> 2 , 'message'=> 'OTP has been sent. Check it', 'data' => $mobile_otp);
					}else{
						$result = array( 'status'=> 2 , 'message'=> 'Unable to Send Mobile Verification Code', 'data' => $mobile_otp);
					}
				}elseif($mobile_verify == 1 && $check_mobile == 0){
					
					$country = $this->site->getCountryName($this->input->post('country_code'));
					
					$customer['country_code'] = $this->input->post('country_code');
					$customer['mobile'] = $this->input->post('mobile');
					$customer['mobile_otp'] = $mobile_otp;
					$customer['email'] = $this->input->post('email');
					$customer['password'] = md5($this->input->post('password'));
					$customer['text_password'] = $this->input->post('password');
					$customer['group_id'] = 3;
					$customer['devices_imei'] = $this->input->post('devices_imei');
					$customer['gender'] = $this->input->post('gender') ? $this->input->post('gender') : '';
					$customer['oauth_token'] = $oauth_token;
					$customer['first_name'] = $this->input->post('first_name');
					$customer['last_name'] = $this->input->post('last_name') ? $this->input->post('last_name') : '';
					$customer['dob'] = $this->input->post('dob') ? $this->input->post('dob') : '';
					$customer['is_edit'] = 1;
					$customer['is_approved'] = 1;
					$customer['active'] = 1;
					$customer['is_edit'] = 1;
					$customer['country'] = $country;
					$customer['created_on'] = date('y-m-d H:i:s');
					$data = $this->customer_api->add_customer($customer);
					if(!empty($data)){
						
						$sms_message = $this->input->post('first_name').' your account has been register successfully.';
						$sms_phone = $this->input->post('country_code').$this->input->post('mobile');
						$sms_country_code = $this->input->post('country_code');
						$response_sms = $this->sms_user($sms_message, $sms_phone, $sms_country_code);
						
						$result = array( 'status'=> 1 , 'message'=> 'Registered Successfully!..', 'data' => $data);
					}else{
						$result = array( 'status'=> 0 , 'message'=> 'Your details not register. please try again');
					}
				}
			}else{
				$result = array( 'status'=> 0 , 'message'=> 'your email already exit. please change..');
			}
			
		}else{
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> 0 , 'message' => $errors[0]);
		}
		$this->response($result);		
	}
	
	public function forgot_post(){
		$data = array();
		$this->form_validation->set_rules('mobile', $this->lang->line("mobile"), 'required');
		$this->form_validation->set_rules('country_code', $this->lang->line("country_code"), 'required');
		if ($this->form_validation->run() == true) {
			
			$row['mobile'] = $this->input->post('mobile');
			$row['country_code'] = $this->input->post('country_code');
			$row['forgot_otp'] = random_string('numeric', 6);
			
			$data = $this->customer_api->forgototp($row);
			if($data){
				
				$sms_phone = $data->country_code.$data->mobile;
				$sms_country_code = $data->country_code;
				$sms_phone_otp = $row['forgot_otp'];

				$response_sms = $this->sms_user_active($sms_phone_otp, $sms_phone, $sms_country_code);
				if($response_sms){
					$result = array( 'status'=> true , 'message'=> 'Success', 'data' => $data);
				}else{
					$result = array( 'status'=> false , 'message'=> 'Unable to Send Mobile Verification Code');
				}
			}else{
				$result = array( 'status'=> false , 'message'=> 'Account does not exist.');
			}
		} else {
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> false , 'message' => $errors[0]);
		}
		$this->response($result);
	}
	
	public function forgotverify_otp_post(){
		$data = array();
		$this->form_validation->set_rules('customer_id', $this->lang->line("customer_id"), 'required');
		$this->form_validation->set_rules('otp', $this->lang->line("otp"), 'required');
		if ($this->form_validation->run() == true) {
			$row['forgot_otp'] = $this->input->post('otp');
			$row['customer_id'] = $this->input->post('customer_id');
			$data = $this->customer_api->forgotcheckotp($row);
			if($data){
				$result = array( 'status'=> true , 'message'=> 'Success', 'data' => $this->input->post('customer_id'));
			}else{
				$result = array( 'status'=> false , 'message'=> 'invaild otp. please check otp');
			}
		} else {
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> false , 'message' => $errors[0]);
		}
		$this->response($result);
	}
	
	public function forgotresend_otp_post(){
		$data = array();
		$this->form_validation->set_rules('customer_id', $this->lang->line("customer_id"), 'required');
		if ($this->form_validation->run() == true) {
			$row['customer_id'] = $this->input->post('customer_id');
			$data = $this->customer_api->forgotresendotp($row);
			if($data){
				
				$sms_phone = $data->country_code . $data->mobile;
				$sms_country_code = $data->country_code;
				$sms_phone_otp = $data->forgot_otp;

				$response_sms = $this->sms_user_active($sms_phone_otp, $sms_phone, $sms_country_code);
				if($response_sms){
					$result = array( 'status'=> true , 'message'=> 'Success', 'data' => $data);
				}else{
					$result = array( 'status'=> false , 'message'=> 'Unable to Send Mobile Verification Code');
				}
			}else{
				$result = array( 'status'=> false , 'message'=> 'invaild otp. please check otp');
			}
		} else {
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> false , 'message' => $errors[0]);
		}
		$this->response($result);
	}
	
	public function resetpassword_post(){
		$data = array();
		$this->form_validation->set_rules('customer_id', $this->lang->line("customer_id"), 'required');
		$this->form_validation->set_rules('password', $this->lang->line("password"), 'required');
		if ($this->form_validation->run() == true) {
			
			$customer['password'] = md5($this->input->post('password'));
			$customer['customer_id'] = $this->input->post('customer_id');
			$customer['text_password'] = $this->input->post('password');
			
			$data = $this->customer_api->updatepassword($customer);
			if($data){
				$result = array( 'status'=> true , 'message'=> 'Success');
			}else{
				$result = array( 'status'=> false , 'message'=> 'Not update password');
			}
			
		} else {
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> false , 'message' => $errors[0]);
		}
		$this->response($result);
	}  
	
	public function login_post(){
		$current_date = date('Y-m-d');
		$this->form_validation->set_rules('password', $this->lang->line("password"), 'required');
		$this->form_validation->set_rules('email', $this->lang->line("email"), 'required');
		if ($this->form_validation->run() == true) {
			
			$check_email = $this->customer_api->checkEmail($this->input->post('email'));
			if($check_email == TRUE){
				
				$email = $this->input->post('email');
				$password = md5($this->input->post('password'));
				
				$data = $this->customer_api->checkLogin($email, $password);
				if(!empty($data)){
					
					$result = array( 'status'=> 1 , 'message'=> 'Login Success', 'data' => $data);
				}else{
					$result = array( 'status'=> 0 , 'message'=> 'Password invaild');
				}
			}else{
				$result = array( 'status'=> 0 , 'message'=> 'Your account is not register');
			}
		}else{
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> 0 , 'message' => $errors[0]);
		}
		$this->response($result);		
	}
	
	public function profile_post(){
		$this->form_validation->set_rules('oauth_token', $this->lang->line("oauth_token"), 'required|callback_check_exist[oauth_token]');
		
		if ($this->form_validation->run() == true) {
			$user_id = $this->customer_api->getUserID($this->input->post('oauth_token'));
			$res = $this->customer_api->getUser($user_id);
			$data[] = $res;
			if($data){
				$result = array( 'status'=> 1 , 'message'=> 'profile edit success', 'data' => $data);
			}else{
				$result = array( 'status'=> 0 , 'message'=> 'faild');
			}
		} else {
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> 0 , 'message' => $errors[0]);
		}
		$this->response($result);
	}
	
	function profile_edit_post(){
		$this->form_validation->set_rules('oauth_token', $this->lang->line("oauth_token"), 'required|callback_check_exist[oauth_token]');
		
		if ($this->form_validation->run() == true) {
			$user_id = $this->customer_api->getUserID($this->input->post('oauth_token'));
			$res = $this->customer_api->getUser($user_id);
			if($res->email != $this->input->post('email')){
				$check_email = $this->customer_api->checkEmail($this->input->post('email'));
				if($check_email == TRUE){
					$result = array( 'status'=> 0 , 'message'=> 'your email already exit. please change..');
				}
			}
			
			$user = array(
				'email' => $this->input->post('email') != 0 ? $this->input->post('email') : $res->email,
				'first_name' => $this->input->post('first_name') != 0 ? $this->input->post('first_name') : $res->first_name,
				'last_name' => $this->input->post('last_name') != 0 ? $this->input->post('last_name') : $res->last_name,
				'gender' => $this->input->post('gender') != 0 ? $this->input->post('gender') : $res->gender,
				'dob' => $this->input->post('dob') != 0 ? $this->input->post('dob') : $res->dob,
				'country_code' => $this->input->post('country_code') != 0 ? $this->input->post('country_code') : $res->country_code,
				'mobile' => $this->input->post('mobile') != 0 ? $this->input->post('mobile') : $res->mobile,
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
			}else{
				$user['photo'] = $res->photo;
			}
			
			$data = $this->customer_api->updateCustomer($user, $user_id);
			if($data){
				$result = array( 'status'=> 1 , 'message'=> 'profile edit success', 'data' => $data);
			}else{
				$result = array( 'status'=> 0 , 'message'=> 'faild');
			}
		} else {
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> 0 , 'message' => $errors[0]);
		}
		$this->response($result);
	}
	
	function ticketbook_post(){
		$this->form_validation->set_rules('oauth_token', $this->lang->line("oauth_token"), 'required|callback_check_exist[oauth_token]');
		$this->form_validation->set_rules('no_of_ticket', lang("no_of_ticket"), 'required');  
		$this->form_validation->set_rules('ticket_price', lang("ticket_price"), 'required');
		$this->form_validation->set_rules('ticket_date', lang("ticket_date"), 'required');
		$this->form_validation->set_rules('package_id', lang("package_id"), 'required');
		
		if ($this->form_validation->run() == true) {
			$user_id = $this->customer_api->getUserID($this->input->post('oauth_token'));
			$res = $this->customer_api->getUser($user_id);
			$package = $this->site->get_packageID($this->input->post('package_id'));
			if($res->email != $this->input->post('booking_email')){
				$booking_user = 1;
			}else{
				$booking_user = 0;
			}
			$booking = array(
				'booking_type' => 0,
				'booking_person_name' => $this->input->post('booking_person_name'),
				'booking_person_mobile' => $this->input->post('booking_person_mobile'),
				'booking_email' => $this->input->post('booking_email'),
				'booking_gender' => $this->input->post('booking_gender'),
				'booking_country' => $this->input->post('booking_country'),
				'package_id' => $this->input->post('package_id'),
				'package_name' => $package->name,
				'package_days' => $package->days,
				'booking_user' => $booking_user,
				'customer_id' => $user_id,
				'booking_code' => 'TICKET'.date('YmdHis'),
				'payment_gateway' => 'Cash',
				'payment_status' => 'Success',
				'payment_transaction_no' => 'TRNO'.date('YmdHis'),
				'no_of_ticket' => $this->input->post('no_of_ticket'),
				'ticket_date' => $this->input->post('ticket_date'),
				'ticket_price' => $this->input->post('ticket_price'),
				'no_adult' => $this->input->post('no_of_ticket'),
				'adult_price' => $this->input->post('ticket_price'),
			);
			
			 $hotel = array(
				'hotel_name' => $this->input->post('hotel_name'),
				'room_no' => $this->input->post('room_no'),
				'created_on' => date('y-m-d H:i:s'),
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
				$hotel['hotel_image'] = 'users/'.$photo;
				$config = NULL;
			}
			
			$data = $this->customer_api->ticketBook($booking, $hotel, $user_id);
			if($data){
				$result = array( 'status'=> 1 , 'message'=> 'Booking success');
			}else{
				$result = array( 'status'=> 0 , 'message'=> 'faild');
			}
		} else {
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> 0 , 'message' => $errors[0]);
		}
		$this->response($result);
	}
	
	public function ticketlist_post(){
		$this->form_validation->set_rules('oauth_token', $this->lang->line("oauth_token"), 'required|callback_check_exist[oauth_token]');
		
		if ($this->form_validation->run() == true) {
			$user_id = $this->customer_api->getUserID($this->input->post('oauth_token'));
			$res = $this->customer_api->getTicketList($user_id);
			$data[] = $res;
			if($data){
				$result = array( 'status'=> 1 , 'message'=> 'profile edit success', 'data' => $data);
			}else{
				$result = array( 'status'=> 0 , 'message'=> 'faild');
			}
		} else {
			$error = $this->form_validation->error_array();
			 foreach($error as $key => $val){
				 $errors[] = $val;
			 }
			 $result = array( 'status'=> 0 , 'message' => $errors[0]);
		}
		$this->response($result);
	}
	
}
