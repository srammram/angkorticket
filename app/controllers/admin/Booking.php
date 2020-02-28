<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Booking extends MY_Controller
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
		$this->upload_path = 'assets/uploads/customers/';
        $this->thumbs_path = 'assets/uploads/customers/thumbs/';
        $this->image_types = 'gif|jpg|png|jpeg|pdf';
		$this->photo_types = 'gif|jpg|png|jpeg|pdf';
		$this->pdf_types = 'gif|jpg|png|jpeg|pdf';
		$this->allowed_file_size = '1024';
		$this->upload_path = 'assets/';
		$this->image_path = base_url('assets/');
		$this->load->admin_model('masters_model');
		$this->load->admin_model('booking_model');
    }
	

	
	
    function index()
    {
		
		$this->site->users_logs($this->session->userdata('user_id'), $this->getUserIpAddr, $this->getUserIpAddr, json_encode($_POST), $_SERVER['REQUEST_URI']);
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
       
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('booking')));
        $meta = array('page_title' => lang('booking'), 'bc' => $bc);
        $this->page_construct('booking/index', $meta, $this->data);
    }
	
    function getBooking(){
		
		$sdate = $this->input->get('sdate');
		$edate = $this->input->get('edate');
		
        $this->load->library('datatables');
        $this->datatables
            ->select(" {$this->db->dbprefix('booking')}.id as id, {$this->db->dbprefix('booking')}.booking_type, {$this->db->dbprefix('booking')}.booking_code, {$this->db->dbprefix('booking')}.no_of_ticket, {$this->db->dbprefix('booking')}.ticket_price, {$this->db->dbprefix('booking')}.ticket_date, {$this->db->dbprefix('booking')}.booking_user, {$this->db->dbprefix('booking')}.booking_person_name, {$this->db->dbprefix('booking')}.booking_person_mobile, {$this->db->dbprefix('booking')}.payment_gateway, {$this->db->dbprefix('booking')}.payment_transaction_no, {$this->db->dbprefix('booking')}.payment_status ")
            ->from("booking");
			
			if(!empty($sdate) && !empty($edate)){
				$this->datatables->where("DATE({$this->db->dbprefix('booking')}.created_on) >=", date("Y-m-d", strtotime(str_replace('/', '-', $sdate))));
       			$this->datatables->where("DATE({$this->db->dbprefix('booking')}.created_on) <=", date("Y-m-d", strtotime(str_replace('/', '-', $edate))));
			}

			
        $this->datatables->unset_column('id');
        echo $this->datatables->generate();
		
    }
	
	function add_booking(){
		$current_date = date('Y-m-d');
		
		$this->site->users_logs($this->session->userdata('user_id'), $this->getUserIpAddr, json_encode($_POST), $_SERVER['REQUEST_URI']);
        $this->form_validation->set_rules('no_of_ticket', lang("no_of_ticket"), 'required');  
		$this->form_validation->set_rules('ticket_price', lang("ticket_price"), 'required');
		$this->form_validation->set_rules('ticket_date', lang("ticket_date"), 'required');
		
        if ($this->form_validation->run() == true) {
			
			
			/*$check_email = $this->people_model->checkEmailcustomer($this->input->post('email'));
			if($check_email == 1){
				$this->session->set_flashdata('error', lang("email_number_already_exits"));
           		admin_redirect('people/add_customer');
			}
				*/		
           $customer = $this->site->get_customer($this->input->post('customer_id'));
		   
		   $booking = array(
		   		'booking_type' => 1,
				'booking_code' => 'TICKET'.date('YmdHis'),
				'booking_person_name' => $customer->first_name.$customer->last_name,
				'booking_person_mobile' => $customer->mobile,
				'booking_email' => $customer->email,
				'booking_gender' => $customer->gender,
				'booking_country' => $customer->country,
				'customer_id' => $this->input->post('customer_id'),
				'no_of_ticket' => $this->input->post('no_of_ticket'),
				'ticket_date' => $this->input->post('ticket_date'),
				'ticket_price' => $this->input->post('ticket_price'),
				'no_adult' => $this->input->post('no_of_ticket'),
				'adult_price' => $this->input->post('ticket_price'),
				'payment_gateway' => 'Cash',
				'payment_status' => 'Success',
				'created_by' => $this->session->userdata('user_id'),
				'created_on' => date('y-m-d H:i:s'),
				
		   );
		   
		   
		   $hotel = array(
				'hotel_name' => $this->input->post('hotel_name'),
				'room_no' => $this->input->post('room_no'),
				'created_on' => date('y-m-d H:i:s'),
			);
			
			
		   if ($_FILES['hotel_image']['size'] > 0) {
				$config['upload_path'] = $this->upload_path.'users/';
				$config['allowed_types'] = $this->photo_types;
				$config['overwrite'] = FALSE;
				$config['max_filename'] = 25;
				$config['encrypt_name'] = TRUE;
				$this->upload->initialize($config);
				if (!$this->upload->do_upload('hotel_image')) {
					$result = array( 'status'=> false , 'message'=> lang('image_not_uploaded'));
				}
				$photo = $this->upload->file_name;
				$hotel['hotel_image'] = 'users/'.$photo;
				$config = NULL;
			}
			
			
        }
		
        if ($this->form_validation->run() == true && $this->booking_model->add_booking($booking, $hotel)){
			$notification['title'] = 'Ticket Booking';
			$notification['message'] = $customer->first_name.$customer->last_name.' has been ticket booking at angkorwat temple.contact details:'.$customer->email.'|'.$customer->mobile;
			$notification['user_id'] = $this->session->userdata('user_id');
			$this->site->insertNotification($notification);
			
			//$sms_message = $this->input->post('first_name').' your account has been register successfully.Your refer code : '.$refer_code.'';
			//$sms_phone = $this->input->post('country_code').$this->input->post('mobile');
			//$sms_country_code = $this->input->post('country_code');
			//$response_sms = $this->sms_user($sms_message, $sms_phone, $sms_country_code);
            $this->session->set_flashdata('message', lang("customer_added"));
            admin_redirect('booking');
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => admin_url('booking/add_booking'), 'page' => lang('customer')), array('link' => '#', 'page' => lang('add_booking')));
            $meta = array('page_title' => lang('add_booking'), 'bc' => $bc);
			$this->data['customers']	 = $this->site->getAllCustomer();
            $this->page_construct('booking/add_booking', $meta, $this->data);
        }        
    }

}
