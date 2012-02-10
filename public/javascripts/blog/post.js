$(function(){
  
  $('pre').each(function(){
    var lang = $(this).attr('class').replace(/brush:/, '');
    if(lang == "") lang = "xml";
    $(this).snippet(lang,{
      style:"vim-dark",
      clipboard:"/flash/ZeroClipboard.swf",
    });
  });
  
  var $aside = $('#post-info');
  var $comments = $('#comments');
  var $title = $('#post > article').find('h1');
  $('#post > article').find('h1, h2').clone().prependTo('#post-info hgroup');
  $('#post-info hgroup').find('h1, h2').each(function(){
    var title = $(this).text();
    $(this).html('<a href="/" class="title-anchor" title="'+title+'">' + title + '</a>');
  });
  
  $(window).scroll(function(){
    var visible_title = '';
    
    if($(document).scrollTop() > ($title.offset().top) && !$aside.find('header').is(':visible') && $(document).scrollTop() <= ($comments.offset().top - 500)){
      $aside.find('div:first').addClass('fixed')
      $aside.find('header').slideDown('fast');
      $aside.find('h2').addClass('inactive')
      $aside.find('h1').removeClass('inactive');
    } else if (($(document).scrollTop() <= ($title.offset().top) || $(document).scrollTop() >= ($comments.offset().top - 500)) && $aside.find('header').is(':visible')) {
      if($(document).scrollTop() < ($comments.offset().top - 500))
        $aside.find('div:first').removeClass('fixed');
      $aside.find('header').slideUp('fast', function(){
        $aside.find('div:first').removeClass('fixed');
      });
    }

    if(isScrolledIntoView($('#post > article > header > h1'))){
      visible_title = $('#post > article > header > h1').text();
    } else {
      $('#post > article > h2').each(function(){
        if(isScrolledIntoView($(this)) && !visible_title){
          visible_title = $(this).text();
        }
      });      
    }

    if(visible_title){
      $aside.find('h1, h2').addClass('inactive');
      if($aside.find('h1').text() == visible_title){
        $aside.find('h1').removeClass('inactive');
      }else{
        $aside.find('h2').each(function(){
          if($(this).text() == visible_title)
            $(this).removeClass('inactive');
        });
      }
    }
        
  });

  $('.title-anchor').click(function(e){
    e.preventDefault();
    var title = $(this).attr('title');
    $('#post > article').find('h1, h2').each(function(){
      if($(this).text() == title){
        $('html, body').animate({scrollTop: $(this).offset().top - 40}, 'fast');
      }
    });
  });
    
});

function isScrolledIntoView(elem)
{
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}
