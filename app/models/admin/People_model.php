<?php defined('BASEPATH') OR exit('No direct script access allowed');

class People_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }
	
	
	function checkEmailcustomer($email){
		
		 $this->db->select('*')->where('email', $email);
		$d =$this->db->where('group_id', 3)->get('users');
		if($d->num_rows()>0){
			return 1;
		}else{
			return 0;	
		}
		
		
	}
	
	/*### Customer*/
	function add_customer($user){
		
		$this->db->insert('users', $user);
        if($user_id = $this->db->insert_id()){
			
	    	return true;
		}
		return false;
    }
	
	
    
}
