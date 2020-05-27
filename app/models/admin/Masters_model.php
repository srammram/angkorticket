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
	
	/*### Package*/
    function add_package($data){
		
		$this->db->insert('package', $data);
        $package_id = $this->db->insert_id();	
		if($package_id){
			return true;
		}
		return false;
    }
    function update_package($id,$data){
		
		$this->db->where('id',$id);
		if($this->db->update('package',$data)){
	    	return true;
		}
		return false;
    }
	
    function getPackageby_ID($id){
		$this->db->select('*');
		$this->db->from('package');
		$this->db->where('id',$id);
		$q = $this->db->get();
		if($q->num_rows()>0){
			return $q->row();
		}
		return false;
    }
	function getALLPackage(){
		$q = $this->db->get('package');
		if($q->num_rows()>0){
			foreach (($q->result()) as $row) {
                $data[] = $row;
            }
			return $data;
		}
		return false;
	}
    function update_package_status($data,$id){
		$this->db->where('id',$id);
		if($this->db->update('package',$data)){
			return true;
		}
		return false;
    }
	
	/*### Currency*/
    function add_currency($data){
		
		$this->db->insert('currency', $data);
        $currency_id = $this->db->insert_id();	
		if($currency_id){
			return true;
		}
		return false;
    }
    function update_currency($id,$data){
		
		$this->db->where('id',$id);
		if($this->db->update('currency',$data)){
	    	return true;
		}
		return false;
    }
	
    function getCurrencyby_ID($id){
		$this->db->select('*');
		$this->db->from('currency');
		$this->db->where('id',$id);
		$q = $this->db->get();
		if($q->num_rows()>0){
			return $q->row();
		}
		return false;
    }
	function getALLCurrency(){
		$q = $this->db->get('currency');
		if($q->num_rows()>0){
			foreach (($q->result()) as $row) {
                $data[] = $row;
            }
			return $data;
		}
		return false;
	}
    function update_currency_status($data,$id){
		$this->db->where('id',$id);
		if($this->db->update('currency',$data)){
			return true;
		}
		return false;
    }
	
	
	/*### Pages*/
    function add_pages($data){
		
		$this->db->insert('pages', $data);
        $package_id = $this->db->insert_id();	
		if($package_id){
			return true;
		}
		return false;
    }
    function update_pages($id,$data){
		
		$this->db->where('id',$id);
		if($this->db->update('pages',$data)){
	    	return true;
		}
		return false;
    }
	
    function getPagesby_ID($id){
		$this->db->select('*');
		$this->db->from('pages');
		$this->db->where('id',$id);
		$q = $this->db->get();
		if($q->num_rows()>0){
			return $q->row();
		}
		return false;
    }
	function getALLPages(){
		$q = $this->db->get('pages');
		if($q->num_rows()>0){
			foreach (($q->result()) as $row) {
                $data[] = $row;
            }
			return $data;
		}
		return false;
	}
    function update_pages_status($data,$id){
		$this->db->where('id',$id);
		if($this->db->update('pages',$data)){
			return true;
		}
		return false;
    }
	
}
