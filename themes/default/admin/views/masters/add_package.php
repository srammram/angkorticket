

<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="box">
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <?php $attrib = array('class' => 'form-horizontal','class' => 'bank_from','data-toggle' => 'validator', 'role' => 'form', 'autocomplete' => "off");
                echo admin_form_open_multipart("masters/add_package", $attrib);
                ?>
                <div class="row">
               	 
                    
                    <div class="col-md-12">  
						<h2 class="box_he_de">Details</h2>
                        
                        
                        <div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('package_name', 'package'); ?>
							<div class="controls">
								<input type="text" id="name" name="name"  class="form-control"/>
							</div>
						</div>
                        <div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('package_days', 'package_days'); ?>
							<div class="controls">
								<input type="text" id="days" name="days"  class="form-control"/>
							</div>
						</div>
						<div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('calender_show_no', 'calender_show_no'); ?>
							<div class="controls">
								<input type="text" id="calender_show_no" name="calender_show_no"  class="form-control"/>
							</div>
						</div>
                        <div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('package_price', 'package_price'); ?>
							<div class="controls">
								<input type="text" id="price" name="price"  class="form-control"/>
							</div>
						</div>

					</div>    
                    
                      
                       
                </div>

                <div class="col-sm-12 last_sa_se"><?php echo form_submit('add_package', lang('submit'), 'class="btn btn-primary change_btn_save center-block"'); ?></div>

                <?php echo form_close(); ?>
 </div>

        </div>
    </div>
</div>
