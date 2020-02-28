<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Angkor Ticket</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="<?= $assets ?>frontend/images/favicon.ico"/>
    
    <?php $this->load->view($this->theme . 'frontend_css'); ?>
    <style>
		.fh5co-cover{
			background:url(<?= $assets ?>/frontend/images/banner_car.png) #efb71c;
		}
	</style>
</head>

<body class="login-page ">
    <div class="fh5co-loader"></div>
    <div id="page">
    	<?php $this->load->view($this->theme . 'frontend_header'); ?>
        <header id="fh5co-header" class="fh5co-cover" role="banner">
            
            <div class="container">
                <div class="row">
                </div>
            </div>
        </header>
        
        <div id="fh5co-services" class="fh5co-bg-section">

		<div class="container">

			<div class="row">

				<div class="col-md-12 col-sm-12 col-xs-12 text-center">

					<div class="feature-center animate-box" data-animate-effect="fadeIn">

						<h3>Angkorticket</h3>

						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim porro, perspiciatis magnam eum explicabo assumenda nostrum, maiores nam doloribus molestias, dolores eius quasi expedita dolore ratione dolorem, voluptatem deserunt? Labore!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim porro, perspiciatis magnam eum explicabo assumenda nostrum, maiores nam doloribus molestias, dolores eius quasi expedita dolore ratione dolorem, voluptatem deserunt? Labore!Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim porro, perspiciatis magnam eum explicabo assumenda nostrum, maiores nam doloribus molestias, dolores eius quasi expedita dolore ratione dolorem, voluptatem deserunt? Labore!</p>

					</div>

				</div>

			</div>

		</div>

	</div>

	

	

	<div id="fh5co-testimonial">

		<div class="container">

        <div class="row">

            <div class="col-md-12 text-center subscription_id">

                <h3>Download the App from</h3>

                <a href="#" target="_blank"><img src="<?= $assets ?>frontend/images/android.png" alt="android" width="200px;"></a>

                <a href=""><img src="<?= $assets ?>frontend/images/apple.png" alt="apple phone" width="200px;"></a>

            </div>

        </div>

    </div>

	</div>

	

	<div id="fh5co-started">

		<div class="container-fluid">

			<div class="row animate-box">

				<div class="col-md-12 text-center">

					<img src="<?= $assets ?>frontend/images/cab/booking_banner.png" class="img-responsive" style="width: 100%;" alt="booking Banner">

				</div>

			</div>

			<div class="row animate-box booking_btn_s">

				<div class="col-md-12">

					<form class="form-inline">

						<div class="col-md-6 col-md-offset-3 col-sm-6 text-center">

							<a href="<?= site_url(); ?>/admin/login?group=3"><button type="button" class="btn btn-default">BOOK NOW</button></a>

						</div>

					</form>

				</div>

			</div>

			<div class="row">

				<div class="col-sm-12 col-xs-12 text-center subscription_email">

					<img src="<?= $assets ?>frontend/images/yellow_logo.png" alt="yellow logo">

					<div class="contact_status"></div>

					<form name="contact-form" method="post" id="contact-form">

						<div class="input-group col-sm-4 col-sm-offset-4 col-xs-12  text-center">

							<input class="form-control" name="email" id="email" type="email" placeholder="Enter Your Email" required>

							 <div class="input-group-append">

								 <button class="btn btn-info btn-sm" id="submit_contact" name="submit_contact" type="submit">GO</button>

							 </div>

						</div>

              		</form>

				</div>

			</div>

		</div>

	</div>
         
         <?php $this->load->view($this->theme . 'frontend_footer'); ?>
         
    </div>
    <?php $this->load->view($this->theme . 'frontend_js'); ?>
<!--<script src="<?= $assets ?>js/jquery.js"></script>
<script src="<?= $assets ?>js/bootstrap.min.js"></script>-->
</body>
</html>
