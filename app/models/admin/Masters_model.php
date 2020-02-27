<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Masters_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }
	function getSettings(){
		$this->db->select('*');
		$q = $this->db->get('settings');
		if($q->num_rows()>0){
			return $q->row();
		}
		return false;
	}
	public function updateSetting($data)
    {
		$this->db->select('*');
        $this->db->where('setting_id', '1');
		$check = $this->db->get('settings');
		
		if($check->num_rows()>0){
			if ($this->db->update('settings', $data)) {
				return true;
			}
		}
        return false;
    }
	
	
}
