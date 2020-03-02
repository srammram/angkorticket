<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="box">
    
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <?php $attrib = array('class' => 'form-horizontal', 'class' => 'add_from','data-toggle' => 'validator', 'role' => 'form', 'autocomplete' => "off");
                echo admin_form_open_multipart("booking/add_booking", $attrib);
                ?>
                <div class="row">
					<div class="col-md-12">  
						<h2 class="box_he_de"><?= lang('personal_details') ?></h2>  
                        
						<div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('customer', 'customer'); ?>
                            <?php
                            $c[''] = 'Select Customer';
                            foreach ($customers as $customer) {
                                $c[$customer->id] = $customer->first_name.' '.$customer->last_name;
                            }
                            echo form_dropdown('customer_id', $c, (isset($_POST['customer_id']) ? $_POST['customer_id'] : ''), 'class="tip form-control select" id="customer_id" data-placeholder="' . lang("select") . ' ' . lang("customer") . '" ');
                            ?>
                        </div>                      
                        
                        
                        
                        
					</div>
					<div class="col-md-12">
						<h2 class="box_he_de"><?= lang('hotel_details') ?></h2> 
                        
						<div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('hotel_name', 'hotel_name'); ?>
							<div class="controls">
								<input type="text" id="hotel_name" onkeyup="inputFirstUpper(this)" name="hotel_name" class="form-control" required="required"/>
							</div>
						</div>

						<div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('room_no', 'room_no'); ?>
							<div class="controls">
								<input type="text" id="room_no" onkeyup="inputFirstUpper(this)" name="room_no" class="form-control"/>
							</div>
						</div>

						
						<div class="form-group all col-sm-3 col-xs-12">
							<?= lang("photo", "photo") ?>
							<input id="hotel_image" type="file" data-browse-label="<?= lang('browse'); ?>" name="hotel_image" data-show-upload="false" data-show-preview="false" class="form-control file" accept="im/*">
							<p class="help-block-small"><?= lang('image_size') ?></p>
						</div>

					</div>
                    
                    <div class="col-md-12">
						<h2 class="box_he_de"><?= lang('ticket_details') ?></h2> 
                        
                        <h4 class="col-md-12 text-danger">
                        Ticket Price per head : <span id="per_head"></span><br>
                        Days : <span id="days"></span>
                        </h4>
                        <div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('package', 'package'); ?>
                            <select name="package_id" id="package_id" class="form-control select">
                            	<option value="">Select Package</option>
                                <?php
								foreach ($packages as $package) {
								?>
                                <option value="<?= $package->id ?>" data-price="<?= $package->price ?>" data-days="<?= $package->days ?>"><?= $package->name ?></option>
                                <?php
								}
								?>
                            </select>
                            
                           
                        </div>   
                        
						<div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('no_of_ticket', 'no_of_ticket'); ?>
							<div class="controls">
								<input type="text" id="no_of_ticket" value="1" name="no_of_ticket" class="form-control" required="required"/>
							</div>
						</div>

						<div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('ticket_price', 'ticket_price'); ?>
							<div class="controls">
								<input type="text" id="ticket_price" readonly value="0.00" name="ticket_price" class="form-control"/>
							</div>
						</div>
                        
                        <div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('ticket_date', 'ticket_date'); ?>
							<div class="controls">
								<input type="text" id="ticket_date" name="ticket_date" class="form-control"/>
							</div>
						</div>
                        
                        <div class="form-group col-sm-3 col-xs-12">
							<?php echo lang('payment_gateway', 'payment_gateway'); ?>
							<div class="controls">
								<input type="text" id="payment_gateway" readonly value="Cash" name="payment_gateway" class="form-control"/>
							</div>
						</div>

						
						
					</div>

                </div>

                <div class="col-sm-12 last_sa_se"><?php echo form_submit('add_booking', lang('submit'), 'class="btn btn-primary change_btn_save center-block"'); ?></div>

                <?php echo form_close(); ?>
 </div>

        </div>
    </div>
</div>

<script>
$(document).on('change', '#no_of_ticket', function(){
	var no_of_ticket = $(this).val();
	var package_price  = $('#package_id option:selected').attr('data-price');
	if(no_of_ticket != 0){
		var price = package_price ? package_price : 0;
		var ticket_price = (no_of_ticket * price).toFixed(2);
		$('#ticket_price').val(ticket_price);
	}
});
$(document).on('change', '#package_id', function(){
	var package_price  = $('#package_id option:selected').attr('data-price');
	var package_days  = $('#package_id option:selected').attr('data-days');
	var no_of_ticket = $('#no_of_ticket').val();
	
	$('#per_head').text(package_price ? package_price : 0.00);
	$('#days').text(package_days ? package_days : 0);
	
	if(no_of_ticket != 0){
		var price = package_price ? package_price : 0;
		var ticket_price = (no_of_ticket * price).toFixed(2);
		$('#ticket_price').val(ticket_price);
	}
});

</script>