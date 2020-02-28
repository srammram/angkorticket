<?php

		preg_match("/[^\/]+$/", basename(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH)), $matches);

		$last_word = $matches[0]; 
		//echo $_SERVER['REQUEST_URI'];

	?>

	<nav class="fh5co-nav" role="navigation">

		<div class="container">

			<div class="row">

				<div class="logo text-center">
					<div id="fh5co-logo"><a href="<?= site_url(); ?>"><img src="<?= $assets ?>frontend/images/logo.png" alt="logo"></a></div>
				</div>

				<div class="left-menu text-center menu-1">
					<?php /*?><ul>
						<li <?php if($last_word == 'index'){ ?> class="active" <?php } ?>><a href="<?= site_url(); ?>">HOME</a></li>
						<li <?php if($last_word == 'aboutus'){ ?> class="active" <?php } ?>><a href="#" >ABOUT US</a></li>
						
						<li <?php if($last_word == 'faq'){ ?> class="active" <?php } ?>><a href="#" >FAQ</a></li>

						<li <?php if($last_word == 'contact'){ ?> class="active" <?php } ?>><a href="<?= site_url('contact'); ?>" >CONTACT</a></li>

						
					</ul><?php */?>
				</div>

				<div class="right-menu text-left menu-1">
					<ul>
						<li class="pull-right"><a href="<?= site_url(); ?>/admin/login?group=3" class="btn btn-default">Login</a></li>
					</ul>
				</div>

				

			</div>

			

		</div>

	</nav>



	





