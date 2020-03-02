<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Angkor Tips</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="<?= $assets ?>images/favicon.ico"/>
    
    <?php $this->load->view($this->theme . 'frontend_css'); ?>
</head>

<body class="login-page ">
    <div class="fh5co-loader"></div>
    <div id="page">
    	<?php $this->load->view($this->theme . 'frontend_header'); ?>
        <header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                </div>
            </div>
        </header>
        <div class="breadcrumb_sec">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div class="scp-breadcrumb">
                            <ul class="breadcrumb">
                                <li><a href="index.php">Home</a></li>
                                <li class="active">Angkor Tips</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
         </div>
         <div id="fh5co-contact">

		<div class="container">

			<div class="row">

				<div class="col-sm-12 col-xs-12 privacy_policy">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo dolores quo doloribus quod delectus magnam aspernatur itaque voluptatibus iure! Voluptatem atque adipisci animi ut pariatur sed consequuntur minus commodi, doloremque!</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo dolores quo doloribus quod delectus magnam aspernatur itaque voluptatibus iure! Voluptatem atque adipisci animi ut pariatur sed consequuntur minus commodi, doloremque!</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo dolores quo doloribus quod delectus magnam aspernatur itaque voluptatibus iure! Voluptatem atque adipisci animi ut pariatur sed consequuntur minus commodi, doloremque!</p>
					
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
