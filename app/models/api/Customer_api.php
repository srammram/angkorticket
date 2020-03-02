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
	
	
	
	function checkEmail($email){
		$this->db->select('id');
		$this->db->where('email', $email);
		$this->db->where('group_id', 3);
		$q = $this->db->get('users');
		if($q->num_rows()>0){
			return true;
		}
		return false;	
	}
	
	function checkMobile($mobile, $country_code){
		$q = $this->db->select('*')->where('mobile', $mobile)->where('country_code', $country_code)->where('group_id', 3)->get('users');
		if($q->num_rows()>0){
			return 1;
		}		
		return 0;
	}
	
	function add_customer($customer){
		$image_path = base_url('assets/');
		$this->db->insert('users', $customer);
		$customer_id = $this->db->insert_id();	
		if($customer_id){
			$setting = $this->site->get_setting();
			$query = "select id, oauth_token, first_name, IFNULL(last_name, 0) as last_name, photo, IFNULL(gender, 0) as gender, IF(dob IS NULL or dob = '', '0', dob) as dob, email, country_code, mobile from {$this->db->dbprefix('users')} where id='".$customer_id."' ";
			$q = $this->db->query($query);
			if($q->num_rows()>0){
				$row = $q->row();
				if($row->photo !=''){
					$row->photo = $image_path.$row->photo;
				}else{
					$row->photo = $image_path.'default.png';
				}
				
				$row->per_head_price = $setting->adult_price ? $setting->adult_price : '0.00';
				$data[] = $row;
				return $data;
			}
		}
		return false;
	}
	
	function forgototp($data){
		$query = "select id from {$this->db->dbprefix('users')} where mobile='".$data['mobile']."' AND country_code='".$data['country_code']."' AND group_id = 3  ";
		$q = $this->db->query($query);
		if($q->num_rows()>0){
			$this->db->where('id', $q->row('id'));
			$this->db->update('users', array('forgot_otp' => $data['forgot_otp'], 'forgot_otp_verify' => 0));
			$data = $q->row();
			return $data;
		}
		return false;
	}
	
	function forgotcheckotp($data){
		$query = "select id from {$this->db->dbprefix('users')} where id='".$data['customer_id']."' AND  forgot_otp='".$data['forgot_otp']."' AND group_id = 3 ";
		$q = $this->db->query($query);
		if($q->num_rows()>0){
			return true;
		}
		return false;
	}
	
	function forgotresendotp($data){
		$query = "select id, forgot_otp from {$this->db->dbprefix('users')} where id='".$data['customer_id']."' AND group_id = 3 ";
		$q = $this->db->query($query);
		if($q->num_rows()>0){
			$data = $q->row();
			return $data;
		}
		return false;
	}
	
	function updatepassword($data){
		
		$this->db->where('id', $data['customer_id']);
		$q = $this->db->update('users', array('password' => $data['password'], 'text_password' => $data['text_password'], 'forgot_otp_verify' => 1));
		if($q){
			return true;	
		}
		return false;
	}
	
	function checkLogin($email, $password){
		$image_path = base_url('assets/');
		$this->db->select('id');
		$this->db->where('email', $email);
		$this->db->where('password', $password);
		$this->db->where('group_id', 3);
		$q = $this->db->get('users');
		if($q->num_rows()>0){
			$setting = $this->site->get_setting();
			$query = "select id, oauth_token, first_name, IFNULL(last_name, 0) as last_name, photo, IFNULL(gender, 0) as gender, 
			IF(dob IS NULL or dob = '', '0', dob) as dob, email, country_code, mobile from {$this->db->dbprefix('users')} where id='".$q->row('id')."' ";
			$u = $this->db->query($query);
			if($u->num_rows()>0){
				$row = $u->row();
				if($row->photo !=''){
					$row->photo = $image_path.$row->photo;
				}else{
					$row->photo = $image_path.'default.png';
				}
				
				$row->per_head_price = $setting->adult_price ? $setting->adult_price : '0.00';
				$data[] = $row;
				return $data;
			}
		}
		return false;
	}
	
	function getUserID($oauth_token){
		$this->db->select('id');
		$this->db->where('oauth_token', $oauth_token);
		$this->db->where('group_id', 3);
		$q = $this->db->get('users');
		if($q->num_rows()>0){
			return $q->row('id');
		}
		return 0;		
	}
	
	function getUser($user_id){
		$image_path = base_url('assets/');
		
		$query = "select id, oauth_token, first_name, IFNULL(last_name, 0) as last_name, photo, IFNULL(gender, 0) as gender, 
		IF(dob IS NULL or dob = '', '0', dob) as dob, email, country_code, mobile from {$this->db->dbprefix('users')} where id='".$user_id."' ";
		$u = $this->db->query($query);
		if($u->num_rows()>0){
			$row = $u->row();
			if($row->photo !=''){
				$row->photo = $image_path.$row->photo;
			}else{
				$row->photo = $image_path.'default.png';
			}
			
			return $row;
		}
		
		return false;
	}
	
	function updateCustomer($user, $user_id){
		$image_path = base_url('assets/');
		$this->db->where('id', $user_id);
		$this->db->where('group_id', 3);
		$q = $this->db->update('users', $user);
		if($q){
			$setting = $this->site->get_setting();
			$query = "select id, oauth_token, first_name, IFNULL(last_name, 0) as last_name, photo, IFNULL(gender, 0) as gender, 
			IF(dob IS NULL or dob = '', '0', dob) as dob, email, country_code, mobile from {$this->db->dbprefix('users')} where id='".$user_id."' ";
			$u = $this->db->query($query);
			if($u->num_rows()>0){
				$row = $u->row();
				if($row->photo !=''){
					$row->photo = $image_path.$row->photo;
				}else{
					$row->photo = $image_path.'default.png';
				}
				
				$row->per_head_price = $setting->adult_price ? $setting->adult_price : '0.00';
				$data[] = $row;
				return $data;
			}
		}
		return false;
	}
	
	function ticketBook($booking, $hotel, $user_id){
		$this->db->insert('booking', $booking);
		if($booking_id = $this->db->insert_id()){
			$hotel['booking_id'] = $booking_id;
			$this->db->insert('hotel_enquiry', $hotel);
	    	return true;
		}
		return false;	
	}
	
	function getTicketList($user_id){
		$image_path = base_url('assets/');
		$this->db->select('b.id as ticket_id, b.booking_person_name, b.booking_person_mobile, b.booking_email, b.booking_gender, b.booking_country, b.booking_code as ticket_code,b.no_of_ticket, b.ticket_date, b.ticket_price, b.payment_gateway, h.hotel_name, h.room_no, h.hotel_image');
		$this->db->from('booking b');
		$this->db->join('hotel_enquiry h', 'h.booking_id = b.id', 'left');
		$this->db->where('b.customer_id', $user_id);
		$q = $this->db->get();
		if($q->num_rows()>0){
			foreach($q->result() as $row){
				
				if($row->hotel_image !=''){
					$row->photo = $image_path.$row->hotel_image;
				}else{
					$row->photo = $image_path.'default.png';
				}
				$data[] = $row;
			}
			return $data;
		}
		return false;
	}
	
}
