<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Site extends CI_Model
{

    public function __construct() {
        parent::__construct();
		$this->load->library('ion_auth');
    }
	
	
	function masterCheck($table_name, $data){
		$q = $this->db->get_where($table_name, $data);
		if ($q->num_rows() > 0) {
			return true;
		}
		return false;	
	}
	
	function getUserIpAddr(){
		if(!empty($_SERVER['HTTP_CLIENT_IP'])){
			//ip from share internet
			$ip = $_SERVER['HTTP_CLIENT_IP'];
		}elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
			//ip pass from proxy
			$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
		}else{
			$ip = $_SERVER['REMOTE_ADDR'];
		}
		return $ip;
	}

	function users_logs($user_id, $ip_address, $post_value, $post_url){
		$q = $this->db->insert('users_logs', array('user_id' => $user_id, 'ip_address' => $ip_address, 'post_value' => $post_value, 'post_url' => $post_url, 'created_on' => date('Y-m-d H:i:s')));	
		if($q){
			return true;	
		}
		return false;
	}
	
    public function get_setting() {
        $this->db->select('*');
		$q = $this->db->get('settings');
		if ($q->num_rows() > 0) {
			return $q->row();
		}
		return false;	
    }
	
	
	public function get_customer($customer_id) {
		$this->db->select('u.id, u.oauth_token, u.country_code, u.mobile, u.email, u.group_id, u.first_name, u.last_name, u.gender, u.dob, u.photo, u.country');
		$this->db->from('users u');
		$this->db->where('u.id', $customer_id);	
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }
	
	public function get_user($user_id) {
		$this->db->select('u.id, u.oauth_token, u.country_code, u.parent_id, u.mobile, u.email, u.devices_imei, u.group_id, u.first_name, u.last_name, u.photo');
		$this->db->from('users u');
		$this->db->where('u.id', $user_id);
		
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }
	
	
	
   public function getSocketID($user_id, $user_type){
		$this->db->select('socket_id');
		$this->db->where('user_id', $user_id);
		$this->db->where('user_type', $user_type);
		//$this->db->where('is_country', $countryCode);
		$this->db->order_by('id', 'DESC');
		$this->db->limit(1);
		$q = $this->db->get('user_socket');
		if ($q->num_rows() == 1) {
			return $q->row('socket_id');
    	}
		return false;
   }
	
    
	
    public function getDateFormat($id) {
        $q = $this->db->get_where('date_format', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }
	
	
	public function getAllGroups() {
		
        $q = $this->db->get('groups');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }
	
    public function modal_js() {
        return '<script type="text/javascript">' . file_get_contents($this->data['assets'] . 'js/modal.js') . '</script>';
    }

	
	
	 public function getAllCustomer() {
		$this->db->select('id, first_name, last_name');
        $q = $this->db->get_where('users', array('group_id' => 3, 'active' => 1));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }
    public function checkPermissions() {
        $q = $this->db->get_where('permissions', array('group_id' => $this->session->userdata('group_id')), 1);
        if ($q->num_rows() > 0) {
            return $q->result_array();
        }
        return FALSE;
    }
    
  function isloggeddIn($user){
        
        $q = $this->db
        ->select()
        ->from('user_logins')
        //->where("username ='$user' or email = '$user' ")
		->where("login_type='A' AND (username ='$user' or email = '$user' )")
        ->order_by('id','DESC')
        ->get();
        $data = $q->row_array();
        if($q->num_rows() > 0){
            if($data['status']=="logged_out"){
                return false;
            }else if(time()>strtotime($data['expiry'])){
               return false;
            }else if(time()>strtotime($data['last_activity'])+300){
               return false;
            }else{
               return true;
            }
        }
       return false;
    }
    public function getUserGroup($user_id = false) {
        if (!$user_id) {
            $user_id = $this->session->userdata('user_id');
        }
        $group_id = $this->getUserGroupID($user_id);
        $q = $this->db->get_where('groups', array('id' => $group_id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }
	public function getUserGroupIDbyname($group_name = false) {

        $q = $this->db->get_where('groups', array('name' => $group_name), 1);
        if ($q->num_rows() > 0) {
            return $q->row('id');
        }
        return FALSE;
    }
	
    public function getUserGroupID($user_id = false) {
        $user = $this->getUser($user_id);
        return $user->group_id;
    }
    function updateLoginStatus($data){
        $session_id = $this->session->userdata('session_id');
        $this->db->where('session_id',$session_id);
        $this->db->update('user_logins',$data);
    }
    function isActiveUser(){
	if($this->router->fetch_method()=="logout"){return true;}
	$session_id = $this->session->userdata('session_id');
	$login_user = $this->session->userdata('username');
        $login_email = $this->session->userdata('email');
        $q = $this->db
        ->select()
        ->from('user_logins')
        ->where("login_type='A' AND (username ='$login_user' or email = '$login_email' )")
	
        ->order_by('id','DESC')
        ->get();
	
	//print_R($q->row());
        if($q->num_rows()>0){
            $row = $q->row();//print_r($row);
	    //echo $session_id.'=='.$row->session_id;exit;
            if($session_id!=$row->session_id) {
		
		$data['status'] = "inactive";		
		$this->updateLoginStatus($data);
		$this->session->set_flashdata(lang('someone has logged in'));
		$this->ion_auth->logout();
		admin_redirect('login');
	    }
        }
    }
   
   
    function unlink_images($name,$path){
		unlink($path.$name);
		return true;
    }
    function my_is_unique($id,$value,$field,$table){
		$q = $this->db->get_where($table,array('id !='=>$id,$field=>$value));
		if($q->num_rows()>0){
			return true;
		}
		return false;
    }
   
	function Getnotification($user_id, $type, $countryCode){
		$this->db->select('*');
		$this->db->where('is_read', 0);
		$this->db->where('user_id', $user_id);
		$q = $this->db->get('notification');
		 if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
	}
	
	function insertNotification($data){
		$q = $this->db->insert('notification', array('user_id' => $data['user_id'], 'title' => $data['title'], 'message' => $data['message'], 'created_on' => date('Y-m-d H:i:s')));
		if($q){
			
			return true;	
		}
		return false;	
	}
	
	function getAdminUser($is_country, $group_id){
		$q = $this->db->select('id')->where('is_country', $is_country)->where('group_id', $group_id)->get('users');
		if($q->num_rows()>0){
			return $q->row('id');
		}
		return 0;
	}
	
	function getCountry(){
		$this->db->select('name, phonecode');
		$q = $this->db->get('countries');
		if($q->num_rows()>0){
			return $q->result();
		}
		return false;
	}
	
	function getCountryName($phonecode){
		$this->db->select('name');
		$this->db->where('phonecode', $phonecode);
		$q = $this->db->get('countries');
		if($q->num_rows()>0){
			return $q->row('name');
		}
		return 0;		
	}
	
}
