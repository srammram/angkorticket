
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-taxi"></i><?= lang('settings'); ?></h2>
       
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                    <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
                    echo admin_form_open_multipart("masters/index/1", $attrib);
                    ?>
                
                	
                    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label" for="overselling"><?= lang("site_name"); ?></label>
                
                            <div class="controls">
                                <?= form_input('site_name', $dataSettings->site_name, 'class="form-control tip" id="site_name"'); ?>
                            </div>
                        </div>
                    </div>
             
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label" for="timezone"><?= lang("timezone"); ?></label>
                            <?php
                            $tzlist = DateTimeZone::listIdentifiers(DateTimeZone::ALL);
                            ?>
                            <select name="timezone" class="form-control" id="timezone" required>
                                <?php
                                foreach($tzlist as  $val){
                                    if($dataSettings->timezone == $val){
                                        $selected = 'selected';
                                    }else{
                                        $selected = '';
                                    }
                                ?>
                                <option value="<?php echo $val; ?>" <?= $selected ?> ><?php echo $val; ?></option>
                                <?php
                                }
                                ?>
                            </select>
                           
                        </div>
                    </div>
                        
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label" for="overselling"><?= lang("child_age_limit"); ?></label>
                
                            <div class="controls">
                                <?= form_input('child_age_limit', $dataSettings->child_age_limit, 'class="form-control tip" id="child_age_limit"'); ?>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label" for="overselling"><?= lang("adult_price"); ?></label>
                
                            <div class="controls">
                                <?= form_input('adult_price', $dataSettings->adult_price, 'class="form-control tip" id="adult_price"'); ?>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="form-group">
                            <label class="control-label" for="overselling"><?= lang("child_price"); ?></label>
                
                            <div class="controls">
                                <?= form_input('child_price', $dataSettings->child_price, 'class="form-control tip" id="child_price"'); ?>
                            </div>
                        </div>
                    </div>
                    
                     <div class="clearfix"></div>
                    <div class="form-group">
                        <div class="controls">
                            <?= form_submit('update_settings', lang("update_settings"), 'class="btn btn-primary"'); ?>
                        </div>
                    </div>
                    <?= form_close(); ?> 
                    
           </div>
        </div>
    </div>
</div>
