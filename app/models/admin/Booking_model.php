<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Booking_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();		
    }
    
	function add_booking($booking, $hotel){
		$this->db->insert('booking', $booking);
		if($booking_id = $this->db->insert_id()){
			$hotel['booking_id'] = $booking_id;
			$this->db->insert('hotel_enquiry', $hotel);
	    	return true;
		}
		return false;	
	}
	
}
