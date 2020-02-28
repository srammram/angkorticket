<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Users_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

	public function getUser($user_id){
		$image_path = base_url('assets/');
		
		$this->db->select('u.*');
		$this->db->from('users u');

		$this->db->where('u.id', $user_id);
		
		$q = $this->db->get();
		//print_r($this->db->last_query());die;
		if ($q->num_rows() > 0) {
			$row = $q->row();
			
			if($row->photo !=''){
				$row->photo_img = $image_path.$row->photo;
			}else{
				$row->photo_img = $image_path.'no_image.png';
			}
			
			
			
            return $row;
        }
		return false;	
	}
	
}
