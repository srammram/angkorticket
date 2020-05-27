

<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div class="box">
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <?php $attrib = array('class' => 'form-horizontal','class' => 'bank_from','data-toggle' => 'validator', 'role' => 'form', 'autocomplete' => "off");
                echo admin_form_open_multipart("masters/edit_pages/".$id, $attrib);
                ?>
                <div class="row">
               	 
                    
                    <div class="col-md-12">  
						<h2 class="box_he_de">Details</h2>
                        
                        <div class="form-group col-sm-6 col-xs-12">
							<?php echo lang('title', 'title'); ?>
							<div class="controls">
								<input type="text" id="title" name="title" value="<?= $pages->title ?>" class="form-control"/>
							</div>
						</div>
                        <div class="form-group col-sm-6 col-xs-12">
							<?php echo lang('meta_title', 'meta_title'); ?>
							<div class="controls">
								<input type="text" id="meta_title" name="meta_title" value="<?= $pages->meta_title ?>"  class="form-control"/>
							</div>
						</div>
						<div class="form-group col-sm-6 col-xs-12">
							<?php echo lang('description', 'description'); ?>
							<div class="controls">
								<textarea class="form-control" name="description" id="description"><?= $pages->description ?></textarea>
							</div>
						</div>
                        <div class="form-group col-sm-6 col-xs-12">
							<?php echo lang('meta_description', 'meta_description'); ?>
							<div class="controls">
								<textarea class="form-control"  name="meta_description" id="meta_description"><?= $pages->meta_description ?></textarea>
							</div>
						</div>
                       

					</div>    
                    
                      
                       
                </div>

                <div class="col-sm-12 last_sa_se"><?php echo form_submit('edit_pages', lang('submit'), 'class="btn btn-primary change_btn_save center-block"'); ?></div>

                <?php echo form_close(); ?>
 </div>

        </div>
    </div>
</div>
