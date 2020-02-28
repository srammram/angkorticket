<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends MY_Controller
{

    function __construct()
    {
        parent::__construct();
        //$this->lang->admin_load('auth', $this->Settings->user_language);
        $this->lang->admin_load('common', $this->Settings->user_language);
		$this->load->library('form_validation');
        $this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));
        $this->load->admin_model('auth_model');
        $this->load->library('ion_auth');
    }

    function index()
    {
		
		
        if (!$this->loggedIn) {
            admin_redirect('login');
        } else {
            $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
            redirect($_SERVER['HTTP_REFERER']);
        }
    }

    
   
    function getUserLogins($id = NULL)
    {
		
        if (!$this->ion_auth->in_group(array('owner', 'admin'))) {
            $this->session->set_flashdata('warning', lang("access_denied"));
            admin_redirect('welcome');
        }
        $this->load->library('datatables');
        $this->datatables
            ->select("login, ip_address, time")
            ->from("user_logins")
            ->where('user_id', $id);

        echo $this->datatables->generate();
    }

  

    function login($m = NULL)
    {
		
		
        if ($this->loggedIn) {
            $this->session->set_flashdata('error', $this->session->flashdata('error'));
            admin_redirect('welcome');
        }
        $this->data['title'] = lang('login');

        
        if ($this->form_validation->run() == true) { 



            $remember = (bool)$this->input->post('remember');
			
            if ($this->ion_auth->login($this->input->post('identity'), $this->input->post('password'), $this->input->post('group_id'), $remember)) {
				
                $this->session->set_flashdata('message', $this->ion_auth->messages());
                $referrer = 'welcome';
                admin_redirect($referrer);
            } else {
				
				
                $this->session->set_flashdata('error', $this->ion_auth->errors());
                admin_redirect('login');
            }
        } else {

            $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
            $this->data['message'] = $this->session->flashdata('message');


            $this->data['identity'] = array('name' => 'identity',
                'id' => 'identity',
                'type' => 'text',
                'class' => 'form-control',
                'placeholder' => lang('email'),
                'value' => $this->form_validation->set_value('identity'),
            );
            $this->data['password'] = array('name' => 'password',
                'id' => 'password',
                'type' => 'password',
                'class' => 'form-control',
                'required' => 'required',
                'placeholder' => lang('password'),
            );
            $this->data['allow_reg'] = $this->Settings->allow_reg;
            if ($m == 'db') {
                $this->data['message'] = lang('db_restored');
            } elseif ($m) {
                $this->data['error'] = lang('we_are_sorry_as_this_sction_is_still_under_development.');
            }
			$this->data['groups'] = $this->site->getAllGroups();
            $this->load->view($this->theme . 'auth/login', $this->data);
        }
    }

    
    function logout($m = NULL)
    {
		
		$this->site->users_logs($this->session->userdata('user_id'), $this->getUserIpAddr, json_encode($_POST), $_SERVER['REQUEST_URI']);
        $data['status'] = "logged_out";
        $this->site->updateLoginStatus($data);
        $logout = $this->ion_auth->logout();
        $this->session->set_flashdata('message', $this->ion_auth->messages());
        admin_redirect('login/' . $m);
    }

    
	
	function language($lang = false)
    {
		
		$user = array();
        if ($this->input->get('lang')) {
            $lang = $this->input->get('lang');
        }
		
        $this->load->library('session');
        $folder = 'app/language/';
        $languagefiles = scandir($folder);
        if (in_array($lang, $languagefiles)) {
            
			 $cookie = array(
                'name' => 'language',
                'value' => $lang,
                'expire' => '31536000',
                'prefix' => 'sma_',
                'secure' => false
            );
			
			$this->session->set_userdata($cookie);
        }
        redirect($_SERVER["HTTP_REFERER"]);
    }

}
