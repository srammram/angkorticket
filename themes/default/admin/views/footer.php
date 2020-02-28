</td></tr></table></div></div><div class="clearfix"></div>
<footer>
<a href="#" id="toTop" class="blue" style="position: fixed; bottom: 30px; right: 30px; font-size: 30px; display: none;">
    <i class="fa fa-chevron-circle-up"></i>
</a>

    <p style="text-align:center;">&copy; <?= date('Y') ?> Heyy CAB </p>
</footer>
</div><div class="modal fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
<div class="modal fade in" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true"></div>
<div id="modal-loading" style="display: none;">
    <div class="blackbg"></div>
    <div class="loader"></div>
</div>
<div id="ajaxCall"><i class="fa fa-spinner fa-pulse"></i></div>
<script type="text/javascript">

var aurl = '<?=admin_url()?>'; 
var siteurl = '<?=site_url()?>'; 
var sUrl = '<?=site_url()?>'; 


</script>

   <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">

<script type="text/javascript" src="<?=$assets?>js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<link rel="stylesheet" href="<?=$assets?>styles/jquery-ui.css">
<script src="<?=$assets?>js/jquery-ui.js"></script>
<script type="text/javascript" src="<?=$assets?>js/jquery.timepicker.min.js"></script>
<script type="text/javascript" src="<?=$assets?>js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<?=$assets?>js/jquery.dataTables.dtFilter.min.js"></script>
<script type="text/javascript" src="<?=$assets?>js/select2.min.js"></script>
<script type="text/javascript" src="<?=$assets?>js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?=$assets?>js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<?=$assets?>js/custom.js"></script>
<script type="text/javascript" src="<?=$assets?>js/jquery.calculator.min.js"></script>
<script type="text/javascript" src="<?=$assets?>js/core.js"></script>
<script type="text/javascript" src="<?=$assets?>js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="<?=$assets?>js/jquery.table2excel.min.js"></script>

<script type="text/javascript" src="<?=$assets?>js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="<?=$assets?>js/event.js"></script>
<script type="text/javascript" src="<?=$assets?>js/magnifier.js"></script>
<script type="text/javascript">
var evt = new Event(),
    m = new Magnifier(evt);
</script>
<script>
	m.attach({
    thumb: '.img',
});
	</script>
 <script>
    $(document).ready(function() {
        $('#summernote').summernote();
    });
  </script>

 <script>
	$('#navigation_container').mCustomScrollbar({ 
        theme:"dark-3",
		mouseWheelPixels:100,
		
	});
	 $('#navigation_container').mCustomScrollbar('scrollTo','0%');
	  $('#navigation_container').mCustomScrollbar('scrollTo',$('#navigation_container').find('.mCSB_container').find('.mainmenu .active'));
	
	</script>
<script>
$('#dashboard_container').mCustomScrollbar({ 
	theme:"dark-3",
	mouseWheelPixels:100 //change this to a value, that fits your needs
});
</script>

<script type="text/javascript" charset="UTF-8">var oTable = '';
    
    $.fn.datetimepicker.dates['sma'] = <?=$dp_lang?>;
    $(window).load(function () {
        var mm = '<?=$m?>';
        var vv = '<?=$m?>_<?=$v?>';
	if(mm == 'rides'){
	    console.log(mm)
            $('.mm_<?=$m?>').addClass('active');
            $('.mm_<?=$m?>').find("ul").first().slideToggle();
	    $type  = '<?=(isset($_GET['type']))?$_GET['type']:''?>';
            $('#'+$type+'_<?=$m?>_<?=$v?>').addClass('active');
	    console.log('#'+$type+'<?=$m?>_<?=$v?>')
            $('.mm_<?=$m?> a .chevron').removeClass("closed").addClass("opened");
	    $('#'+$type+'_<?=$m?>_<?=$v?>').parent('li ul:first').slideToggle();
         }
        else if(mm != 'system_settings'){
            $('.mm_<?=$m?>').addClass('active');
            $('.mm_<?=$m?>').find("ul").first().slideToggle();
            $('#<?=$m?>_<?=$v?>').addClass('active');
            $('.mm_<?=$m?> a .chevron').removeClass("closed").addClass("opened");
	    $('#<?=$m?>_<?=$v?>').parent('li.mm_<?=$m?>_submenu ul:first').slideToggle();
         }
         else
         {
            if(vv == 'system_settings_index')
            {                
                $('.mm_system_settings,.mm_pos').addClass('active');
                $('.mm_pos').find("ul").first().slideToggle();
                $('.mm_tables').removeClass('active');
                $('#system_settings_index').addClass('active');
            }
            if(vv == 'system_settings_warehouses')
            {
                $('.mm_tables,.mm_system_settings').addClass('active');
                $('.mm_system_settings').find("ul").first().slideToggle();
                $('.mm_system_settings').removeClass('active');
                $('#system_settings_warehouses').addClass('active');
            }
         }
    });
</script>

<script type="text/javascript">
$(".numberonly").keypress(function (event){
	
	if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
		event.preventDefault();
	}
  
	});
</script>

<script type="text/javascript">



function checkValue(str, max) {
  if (str.charAt(0) !== '0' || str == '00') {
    var num = parseInt(str);
    if (isNaN(num) || num <= 0 || num > max) num = 1;
    str = num > parseInt(max.toString().charAt(0)) && num.toString().length == 1 ? '0' + num : num.toString();
  };
  return str;
};



function inputUpper(input) {
	input.value = input.value.toUpperCase();
}
function inputlower(input) {
	input.value = input.value.toLowerCase();
}

function inputFirstUpper(input) {
	input.value = input.value.charAt(0).toUpperCase() + input.value.slice(1);
}


</script>

<script type="text/javascript">

var d_age = new Date();
var year_d_age = d_age.getFullYear() - 18;
d_age.setFullYear(year_d_age);

function getDate(element) {
	var date;
	try {
		date = $.datepicker.parseDate(dateFormat, element.value);
	} catch (error) {
		date = null;
	}
	return date;
}

$('#dob').datepicker({
	dateFormat: "dd/mm/yy" ,
	defaultDate: d_age,
	changeMonth: true,
	changeYear: true,
	maxDate: d_age,
	yearRange: '-100:+0',
	   
});




function hideDaysFromCalendar() {
	var thisCalendar = $(this);
	$('.ui-datepicker-calendar').detach();
	// Also fix the click event on the Done button.
	$('.ui-datepicker-close').unbind("click").click(function() {
		var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		thisCalendar.datepicker('setDate', new Date(year, month, 1));
	});
}

</script>

<script type="text/javascript">
  var tmpAnimation = 0;
  $("button").click(function(){
	  var imagevalue = $(this).parent().find(".image-link").find('img');
	  
    var element = imagevalue;
    tmpAnimation = tmpAnimation + 90;
    
    $({degrees: tmpAnimation - 90}).animate({degrees: tmpAnimation}, {
        duration: 3000,
        step: function(now) {
            element.css({
                transform: 'rotate(' + now + 'deg)'
            });
        }
    });
  });
</script>


</body>
</html>
