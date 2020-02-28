<style>
.mainmenu{padding: 0px;margin: 10% 0px 0px;list-style-type: none;position: relative;}
.navbar-collapse,#sidebar-left{padding: 0px;}
.mainmenu li{padding: 6px 0px;color: #fff;}
.mainmenu li span{padding-left: 15px;}
	.mainmenu li strong{position: absolute;margin-left: 10px;color: #bdb6b6; font-weight: 600;}
.mainmenu li a {
  display: block;
  background-color: transparent;
  text-decoration: none;
  padding: 6px 0px 6px 20%;
  color: #fff;
}
	.mainmenu li a::before{position: absolute;content:'';width: 10px;height: 10px;background-color: #fff;left: 10%;margin-top: 6px;border-radius: 50px; }
	.mainmenu li a:hover:before{background-color: #000;}
.mainmenu a:hover {
    background-color: #bdb6b6;
	color: #000;transition: all 0.25s ease;
	font-weight: bold;
}
.mainmenu .active {
    background-color: #bdb6b6;
    color: #000;
	font-weight: bold;
}
.mainmenu li .active:before{background-color: #000;}
.mainmenu li:hover .submenu {
  display: block;
  max-height: 200px;
}
.submenu a {
  background-color: #999;
}

.submenu a:hover {
  background-color: #666;
}
.submenu {
  overflow: hidden;
  max-height: 0;
  -webkit-transition: all 0.5s ease-out;
}

	#sidebar_menu h3{margin:5px 0px;}
</style>
<div class="clearfix"></div>
	

<nav class="navigation" id="navigation_container">

  <ul class="mainmenu">
   <li><a class="<?= $this->uri->segment(2) == 'welcome' ? 'active' : '' ?>" href="<?=admin_url('welcome')?>"><?= lang('statistics') ?></a></li>
           
	<li><a class="<?= $this->uri->segment(2) == 'notification' ? 'active' : '' ?>" href="<?=admin_url('notification/index')?>"><?= lang('notification') ?></a></li>
    <li><a class="<?= $this->uri->segment(2) == 'booking' && ($this->uri->segment(3) == 'index') ? 'active' : '' ?>" href="<?=admin_url('booking/index')?>"><?= lang('booking') ?></a></li>
    
   <li><a class="<?= $this->uri->segment(2) == 'people' && ($this->uri->segment(3) == 'customer' || $this->uri->segment(3) == 'customer_view' || $this->uri->segment(3) == 'add_customer') ? 'active' : '' ?>" href="<?=admin_url('people/customer')?>"><?= lang('customer') ?></a></li>
   <li><a class="<?= $this->uri->segment(2) == 'masters' && $this->uri->segment(3) == 'index' ? 'active' : '' ?>" href="<?=admin_url('masters/index/'.$countryCode)?>"><?= lang('settings') ?></a></li>
  </ul>
</nav>
