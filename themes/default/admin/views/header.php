<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="<?=admin_url()?>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    <title> <?= lang('heyy_cab') ?></title>
    <!--<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">-->
    <link rel="shortcut icon" href="<?=$assets?>images/favicon.ico"/>
    <link href="<?=$assets?>styles/jquery.mCustomScrollbar.css" rel="stylesheet"/>
    <link href="<?=$assets?>styles/magnifier.css" rel="stylesheet"/>
    
    <link href="<?=$assets?>styles/theme.css" rel="stylesheet"/>
    
    <link href="<?=$assets?>styles/style.css" rel="stylesheet"/>
    <!--<link href="<?=$assets?>styles/flipclock.css" rel="stylesheet"/>-->
    <link href="<?=$assets?>styles/jquery.timepicker.css" rel="stylesheet"/>
    <link href="<?=$assets?>styles/magnific-popup.css" rel="stylesheet"/>
    <script type="text/javascript" src="<?=$assets?>js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="<?=$assets?>js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="<?=$assets?>js/bootstrapValidator.min.js"></script>
    <!--<script type="text/javascript" src="<?=$assets?>js/jquery-migrate-1.2.1.min.js"></script>-->
    <script type="text/javascript" src="<?=$assets?>js/jquery.validate.js"></script>
    <!--<script type="text/javascript" src="<?=$assets?>js/flipclock.min.js"></script>-->
    
    
    
   
    <noscript><style type="text/css">#loading { display: none; }</style></noscript>
        <script type="text/javascript">
        $(window).load(function () {
            $("#loading").fadeOut("slow");
        });
    </script>

  <script type="text/javascript">
   var site_url = '<?=admin_url()?>';
   var image_site = '<?=site_url()?>'; 
  </script>
 
</head>

<body>

<div id="loading"></div>
<div id="app_wrapper">
    <header id="header" class="navbar">
        <div class="container">
	 

        	<div class="row">
            	<a class="text-center slide-logo" href="<?=admin_url()?>"><img src="<?=$assets?>images/logo.png" style="
    width: auto;"></a>
    		<div class="btn-group visible-xs pull-right btn-visible-sm">
                <button class="navbar-toggle btn" type="button" data-toggle="collapse" data-target="#sidebar_menu">
                    <span class="fa fa-bars"></span>
                </button>
                <a href="<?=admin_url()?>users/profile/1" class="btn">
                    <span class="fa fa-user"></span>
                </a>
                <a href="<?=admin_url()?>logout" class="btn">
                    <span class="fa fa-sign-out"></span>
                </a>
            </div>
            <div class="header-nav">
                <ul class="nav navbar-nav pull-right">
                	<li class="dropdown">
                        <a class="btn account dropdown-toggle" data-toggle="dropdown" href="#">
                               <?php
							  // print_r($this->data['Bnotify']);
							   ?>
                            <i class="fa fa-bell" title="<?= lang('booking_cancel_notification') ?>" aria-hidden="true"></i><small><?= $this->data['Bnotify']['booking_count'] ?></small>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <?php
							if(!empty($this->data['Bnotify']['result'])){
								foreach($this->data['Bnotify']['result'] as $bnotify){
							?>
                            <li>
                                <a href="<?=admin_url('booking_crm/tracking?booking_id='.$bnotify->ride_id.'&is_country='.$bnotify->is_country.'&is_read=1')?>">
                                    This ticket <?= $bnotify->ticket_code ?> has been cancelled.
                                </a>
                            </li>
                            <?php
								}
							}else{
							?>
                            <li>
                                No Notification
                            </li>
                            <?php
							}
							?>
                        </ul>
                    </li>
                    
                    <li class="dropdown">
                        <a class="btn account dropdown-toggle" data-toggle="dropdown" href="#">
                            <img alt="" src="<?=$assets?>images/male.png" class="mini_avatar img-circle">


                        </a>
                        <ul class="dropdown-menu pull-right">
                          
                            <li>
                                <a href="<?=admin_url('users/profile')?>">
                                    <?= lang('account') ?>   
                                </a>
                            </li>
                            <li>
                                <a href="<?=admin_url('verification/index')?>">
                                    <?= lang('verification') ?>   
                                </a>
                            </li>
							<li>
								<a href="<?=admin_url()?>logout">
                            		<i class="fa fa-sign-out"></i>  <?= lang('logout') ?>   
							 	</a>
							</li>
                             
                           
                        </ul>
                    </li>
                    
                </ul>
                <ul class="nav navbar-nav pull-right">
                		<li class="dropdown hidden-xs">
                        <a class="btn btn-default tip" title="<?= lang('language') ?>" data-placement="bottom" data-toggle="dropdown"
                           href="#">
                            <img src="<?= base_url('assets/images/' . $Settings->user_language . '.png'); ?>" alt="">
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <?php $scanned_lang_dir = array_map(function ($path) {
                                return basename($path);
                            }, glob(APPPATH . 'language/*', GLOB_ONLYDIR));
							//print_r($scanned_lang_dir);
                            foreach ($scanned_lang_dir as $entry) { 
							//if($entry == 'english' || $entry == 'khmer'){
								?>
                                <li>
                                    <a href="<?= admin_url('auth/language/' . $entry); ?>">
                                        <img src="<?= base_url('assets/images/'.$entry.'.png'); ?>" class="language-img">
                                        &nbsp;&nbsp;<?= ucwords($entry); ?>
                                    </a>
                                </li>
                            <?php //} 
							} ?>
                            
                        </ul>
                    </li>
<!--                    <li class="dropdown hidden-xs"><a class="btn tip" title=" Dashboard" data-placement="bottom" href="<?=admin_url()?>welcome"><i class="fa fa-dashboard"></i></a></li>-->
                    	<!--<li class="dropdown hidden-sm">
                            <a class="btn tip" title="Search" data-placement="bottom" href="#" data-toggle="dropdown" data-original-title=" Notifications">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </a>
                            <ul class="dropdown-menu pull-right calc">
                                <li>
                                    <a href="javascript:void(0)" class=""><input type="text" placeholder="search"></a>
                                </li>
                            </ul>
                        </li>-->
                    	<!--<li class="dropdown hidden-sm">
                            <a class="btn tip" title="" data-placement="bottom" href="#" data-toggle="dropdown" data-original-title=" Notifications">
                                <i class="fa fa-bell" aria-hidden="true"></i>
                                <span class="number bred white">4</span>
                            </a>
                            <ul class="dropdown-menu pull-right"  style="display: none;">
                                <li>
                                    <a href="#" class="">
                                        <span class="label label-danger pull-right" style="margin-top:3px;">1</span>
                                        <span style="padding-right: 35px;">Notification</span>
                                    </a>
                                </li>
								<li>
                                    <a href="#" class="">
                                        <span class="label label-danger pull-right" style="margin-top:3px;">2</span>
                                        <span style="padding-right: 35px;">notification</span>
                                    </a>
                                </li>
                            </ul>
                        </li>-->
                    	<!--<li class="dropdown hidden-sm">
                            <a class="btn tip" title="" data-placement="left" data-toggle="dropdown" href="#" data-original-title=" Alerts">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                                <span class="number bred white">4</span>
                            </a>
                            <ul class="dropdown-menu pull-right" style="display: none;">
								<li>
                                    <a href="#" class="">
                                        <span class="label label-danger pull-right" style="margin-top:3px;">1</span>
                                        <span style="padding-right: 35px;">Message1</span>
                                    </a>
                                </li>
								<li>
                                    <a href="#" class="">
                                        <span class="label label-danger pull-right" style="margin-top:3px;">2</span>
                                        <span style="padding-right: 35px;">Message1</span>
                                    </a>
                                </li>
							</ul>
                        </li>-->
				</ul>
            </div>
            
            </div>
        </div>
    </header>

    <div class="container" id="container">
        <div class="row" id="main-con">
        <table class="lt"><tr><td class="sidebar-con">
            <div id="sidebar-left">
                <div class="sidebar-nav nav-collapse collapse navbar-collapse" id="sidebar_menu">
                	<div class="col-lg-12 text-center">
                    	<h3 class="yellow"><?= lang('admin_panel') ?></h3>
                         <img alt="" src="<?=$assets?>icons/male-lg.png" class="mini_avatar img-rounded">
                         <h3 class="yellow"><?= $this->session->userdata('username') ?></h3> 
                    </div>
                    
                   <?=@$navigation?>
                </div>
                <a href="#" id="main-menu-act" class="hidden">
                    <i class="fa fa-angle-double-left"></i>
                </a>
            </div>
            </td><td class="content-con">
            <div id="content">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                       <h3 class="dashboard_he"><?= $page_title ?></h3>
                        <ul class="breadcrumb">
                            <?php
                            /*foreach ($bc as $b) {
                                if ($b['link'] === '#') {
                                    echo '<li class="active">' . $b['page'] . '</li>';
                                } else {
                                    echo '<li><a href="' . $b['link'] . '">' . $b['page'] . '</a></li>';
                                }
                            }*/
                            ?>
                           
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 content-container" id="dashboard_container">
                        <?php if ($message) { ?>
                            <div class="alert alert-success">
                                <button data-dismiss="alert" class="close" type="button">x</button>
                                <?= $message; ?>
                            </div>
                        <?php } ?>
                        <?php if ($error) { ?>
                            <div class="alert alert-danger">
                                <button data-dismiss="alert" class="close" type="button">x</button>
                                <?= $error; ?>
                            </div>
                        <?php } ?>
                        <?php if ($warning) { ?>
                            <div class="alert alert-warning">
                                <button data-dismiss="alert" class="close" type="button">x</button>
                                <?= $warning; ?>
                            </div>
                        <?php } ?>
                        <?php
                        if (@$info) {
                            foreach ($info as $n) {
                                if (!$this->session->userdata('hidden' . $n->id)) {
                                    ?>
                                    <div class="alert alert-info">
                                        <a href="#" id="<?= $n->id ?>" class="close hideComment external"
                                           data-dismiss="alert">&times;</a>
                                        <?= $n->comment; ?>
                                    </div>
                                <?php }
                            }
                        } ?>
                        <div class="alerts-con"></div>