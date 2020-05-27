

<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="box">
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <?php $attrib = array('class' => 'form-horizontal','class' => 'bank_from','data-toggle' => 'validator', 'role' => 'form', 'autocomplete' => "off");
                echo admin_form_open_multipart("masters/edit_currency/".$id, $attrib);
                ?>
                <div class="row">
               	 
                    
                    <div class="col-md-12">  
						<h2 class="box_he_de">Details</h2>
                        
						<div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('currency_name', 'currency_name'); ?>
							<div class="controls">
								<input type="text" id="name" name="name" value="<?= $currency->name ?>" class="form-control"/>
							</div>
						</div>
                        <div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('symbol', 'symbol'); ?>
							<div class="controls">
								<input type="text" id="symbol" name="symbol" value="<?= $currency->symbol ?>" class="form-control"/>
							</div>
						</div>
						<div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('unicode_symbol', 'unicode_symbol'); ?>
							<div class="controls">
								<input type="text" id="unicode_symbol" name="unicode_symbol" value="<?= $currency->unicode_symbol ?>" class="form-control"/>
							</div>
						</div>
                       
                        

					</div>    
                    
                      
                       
                </div>

                <div class="col-sm-12 last_sa_se"><?php echo form_submit('edit_currency', lang('submit'), 'class="btn btn-primary change_btn_save center-block"'); ?></div>

                <?php echo form_close(); ?>
 </div>

        </div>
    </div>
</div>
