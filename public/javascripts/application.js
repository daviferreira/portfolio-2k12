$('div.select a').live('click', function(e){
  $('.filter-options').hide();
  $('div.select a').parent().removeClass('active');
  $(this).parent().toggleClass('active');
  var div = $(this).attr('href').replace(/#/, '');
  $('#options-'+div).fadeToggle('fast');
  e.preventDefault();
});

var timer_menu = "";
var timer_live = "";
var timer_live_result = "";

$('div.select.active').live('mouseleave', function(){
  var div = this;
  timer_menu = setTimeout(function(){
    $(div).next().fadeOut('fast', function(){
      $(div).removeClass('active');
    });
  }, 400);    
});

$('div.select.active, .filter-options:visible').live('mouseover', function(){
  clearTimeout(timer_menu);
});

$('#fld-search, #live-search').live('mouseover', function(){
  clearTimeout(timer_live_result);
});

$('#fld-search, #live-search').live('mouseleave', function(){
  timer_live_result = setTimeout(function(){
    $('#live-search').fadeOut('fast', function(){
      $(this).find('ul').html('');
    });
  }, 400);
});

$(function(){	

  $('.filter-options').mouseleave(function(){
    var div = this;
    timer_menu = setTimeout(function(){
      $(div).fadeOut('fast', function(){
        $(div).prev().removeClass('active');
      });
    }, 400);
  });
  
  $('#fld-search').keyup(function(e){
    var q = $(this).val();
    var fld = this;
    clearTimeout(timer_live);
    if(q != ""){
      timer_live = setTimeout(function(){
        $.get("/live_search?q="+q);
      }, 500);
    }
  });
  
  var height = 0;
	$('#projects-main > li > div').each(function(){
	  if($(this).height() > height) height = $(this).height();
	});
	$('#projects-main > li > div').each(function(){
	  $(this).height(height);
  });
  $("a[rel*=external]").attr( "target", "_blank" );
  
  $('#frm-search').submit(function(e){
    var q = $('#fld-search').val();
    if(!q){
      $('#fld-search').css('border-color', 'red').focus();
      e.preventDefault();
    }
  });
  $('a[href^=#]').live('click', function(e){
    var href = $(this).attr('href');
    if($(href).length > 0){
      $('html, body').animate({
          scrollTop: $(href).offset().top
      }, 600);
      e.preventDefault();
    }
  });
  $("div#screenshots a").fancybox({
		'transitionIn'	: 'elastic',
		'transitionOut'	: 'elastic',
		'easingIn'      : 'easeOutBack',
		'easingOut'     : 'easeInBack',
		'titlePosition' 	: 'over',
    		'titleFormat'       : function(title, currentArray, currentIndex, currentOpts) {
    		    return '<span id="fancybox-title-over">Imagem ' +  (currentIndex + 1) + ' / ' + currentArray.length + ' ' + title + '</span>';
    		}
	});
});