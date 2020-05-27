<?php defined('BASEPATH') OR exit('No direct script access allowed');

// Framework routes
$route['default_controller'] = 'main';
$route['sos'] = 'main/sos';


$route['privacy_policy'] = 'main/privacy_policy';
$route['angkor_tips'] = 'main/angkor_tips';
$route['booking_conditions'] = 'main/booking_conditions';

$route['(:any)'] = 'main/page/$1';

$route['404_override'] = 'notify/error_404';
$route['translate_uri_dashes'] = TRUE;

//$route['admin'] = 'admin/welcome';
$route['admin/login'] = 'admin/auth/login';
$route['admin/login/(:any)'] = 'admin/auth/login/$1';
$route['admin/logout'] = 'admin/auth/logout';
$route['admin/logout/(:any)'] = 'admin/auth/logout/$1';
?>



