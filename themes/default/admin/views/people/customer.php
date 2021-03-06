<script>
    function active_status(x) {
		
        var y = x.split("__");
		
        return y[1] == 1 ?
        '<a href="'+site.base_url+'people/status/deactive/'+ y[0] +'"><span class="label label-success">  '+lang['active']+'</span></a>' :
        '<a href="'+site.base_url+'people/status/active/'+ y[0] +'"><span class="label label-danger">  '+lang['inactive']+'</span><a/>';
    }
	
	
	
	function mobile_status(mob) {
		if(mob == null){
			return 'N/A';
		}else{
			var mobile = mob.slice(-4);		
			return '******'+mobile;
		}
    }
	
	
	
    $(document).ready(function () {
        'use strict';
        oTable = $('#UsrTable').dataTable({
            "aaSorting": [[0, "desc"]],
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('all') ?>"]],
            "iDisplayLength": <?= $Settings->rows_per_page ?>,
            'bProcessing': true, 'bServerSide': true,
            'sAjaxSource': '<?= admin_url('people/getCustomer?sdate='.$_GET['sdate'].'&edate='.$_GET['edate']) ?>',
            'fnServerData': function (sSource, aoData, fnCallback) {
                aoData.push({
                    "name": "<?= $this->security->get_csrf_token_name() ?>",
                    "value": "<?= $this->security->get_csrf_hash() ?>"
                });
                $.ajax({'dataType': 'json', 'type': 'POST', 'url': sSource, 'data': aoData, 'success': fnCallback});
            },
            "aoColumns": [ {"mRender": empty_status}, {"mRender": empty_status}, {"mRender": empty_status}, {"mRender": empty_status},  {"mRender": mobile_status},{"mRender": empty_status}, {"mRender": empty_status},  {"bSortable": true}]
        });
    });
</script>
<style>.table td:nth-child(6) {
        text-align: right;
        width: 10%;
    }

    .table td:nth-child(8) {
        text-align: center;
    }</style>
<?php if ($Owner) {
    echo admin_form_open('people/customer_actions', 'id="action-form"');
} ?>
<div class="box">
 <a href="<?= admin_url('people/add_customer'); ?>"><button type="button" class="btn btn-primary add_se_btn center-block"><i class="fa fa-plus-circle"></i> <?= lang("add_customer"); ?></button></a>
 
    
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                
                <div class="col-lg-3">
            <div class="form-group">
                <?php echo lang('start_date', 'Start Date'); ?>
                <div class="controls">
                    <input type="text" id="start_date" name="start_date" onkeypress="dateCheck(this);" class="form-control" value="<?= $_GET['sdate'] ?>"/>
                </div>
             </div>
            </div>
            <div class="col-lg-3">        
                    <div class="form-group">
                        <?php echo lang('end_date', 'End Date'); ?>
                        <div class="controls">
                            <input type="text" id="end_date" name="end_date" onkeypress="dateCheck(this);" class="form-control"  value="<?= $_GET['edate'] ?>"/>
                        </div>
                    </div>
                    
            </div>

            
            <div class="col-lg-3 row">
            <div class="form-group col-lg-7">
                <?php echo lang('&nbsp;'); ?><br>
               <a href="javascript:void(0)" id="filte_ride" class="btn btn-primary btn-block"><?= lang('search') ?></a>
            </div>
           
            <div class="form-group col-lg-5">            	
                <?php echo lang('&nbsp;'); ?><br>
                 <?php
				$uri_parts = explode('?', $_SERVER['REQUEST_URI'], 2);
				?>
               <a href="<?php echo 'http://'.$_SERVER['HTTP_HOST'].$uri_parts[0]; ?>" id="resetfilter"  class="btn btn-primary btn-block"><?= lang('reset') ?></a>
            </div>            
            </div>
            <div class="clearfix"></div>

                <div class="table-responsive">
                    <table id="UsrTable" cellpadding="0" cellspacing="0" border="0"
                           class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <th ><?php echo lang('create_date'); ?></th>
                            <th ><?php echo lang('first_name'); ?></th>
                            <th ><?php echo lang('last_name'); ?></th>
                            <th ><?php echo lang('email'); ?></th>
                            <th ><?php echo lang('mobile'); ?></th>
                            <th ><?php echo lang('gender'); ?></th>
                            <th ><?php echo lang('dob'); ?></th>
                            <th ><?php echo lang('actions'); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="9" class="dataTables_empty"><?= lang('loading_data_from_server') ?></td>
                        </tr>
                        </tbody>
                       
                    </table>
                </div>

            </div>

        </div>
    </div>
</div>
<?php if ($Owner) { ?>
    <div style="display: none;">
        <input type="hidden" name="form_action" value="" id="form_action"/>
        <?= form_submit('performAction', 'performAction', 'id="action-form-submit"') ?>
    </div>
    <?= form_close() ?>

    <script language="javascript">
        $(document).ready(function () {
            $('#set_admin').click(function () {
                $('#usr-form-btn').trigger('click');
            });

        });
    </script>

<?php } ?>

<script>
$(document).ready(function(){
	
	function getDate(element) {
     var date;
     try {
       date = element.value;
     } catch (error) {
       date = null;
     }

     return date;
   }

	var dateFormat =  "dd/mm/yy";
		
	var start_date = $("#start_date") .datepicker({
       defaultDate: "+1w",
	   
	   dateFormat: "dd/mm/yy" ,
		changeMonth: true,
		changeYear: true,
		
		maxDate: 0,
		numberOfMonths: 1,
		yearRange: '-100:+0'
	})
	.on("change", function() {
		end_date.datepicker("option", "minDate", getDate(this));
	});
	
	var end_date = $("#end_date") .datepicker({
       defaultDate: "+1w",
	   
	   dateFormat: "dd/mm/yy" ,
		changeMonth: true,
		changeYear: true,
		
		maxDate: 0,
		numberOfMonths: 1
	})
	.on("change", function() {
		start_date.datepicker("option", "maxDate", getDate(this));
	});
	
	$('#filte_ride').click(function(e) {
        var site = '<?php echo site_url() ?>';
		var sdate = $('#start_date').val();
		var edate = $('#end_date').val();
		var approved = $('#approved').val();
		window.location.href = site+"admin/people/customer?sdate="+sdate+"&edate="+edate+"&approved="+approved;
		
    });

});

</script>