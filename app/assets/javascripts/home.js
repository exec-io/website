var setWindowHeight = function() {
  var windowHeight = $(window).height();
  $('section.home-panel').css("min-height", windowHeight);
}

var resizeWindow = function() {
  setWindowHeight();
}

$(document).on('scroll', function(){
  var panels = $('section.home-panel').length;

  var heightP1 = $('section.home-panel:nth-child(10n+2)').outerHeight();  
  var heightP2 = $('section.home-panel:nth-child(10n+3)').outerHeight() + heightP1;
  var heightP3 = $('section.home-panel:nth-child(10n+4)').outerHeight() + heightP2;
  var heightP4 = $('section.home-panel:nth-child(10n+5)').outerHeight() + heightP3;
  var heightP5 = $('section.home-panel:nth-child(10n+5)').outerHeight() + heightP4;
  var heightP6 = $('section.home-panel:nth-child(10n+5)').outerHeight() + heightP5;
  var scrollPos = $(window).scrollTop();  
  if (scrollPos >= heightP6) {
    $('#links a').removeClass('active');
    $('#links a[data-link=locations]').addClass('active');
    $('body').removeClass().addClass('s6');
  } else if (scrollPos >= heightP5) {
    $('#links a').removeClass('active');
    $('#links a[data-link=our-board]').addClass('active');
    $('body').removeClass().addClass('s5');
  } else if (scrollPos >= heightP4) {
    $('#links a').removeClass('active');
    $('#links a[data-link=about-us]').addClass('active');
    $('body').removeClass().addClass('s4');
  } else if (scrollPos >= heightP3) {
    $('#links a').removeClass('active');
    $('#links a[data-link=about-rethink-training]').addClass('active');
    $('body').removeClass().addClass('s3');
  } else if (scrollPos >= heightP2) {
    $('#links a').removeClass('active');
    $('#links a[data-link=about-real-statistics]').addClass('active');
    $('body').removeClass().addClass('s2');
  } else if (scrollPos >= heightP1) {
    $('#links a').removeClass('active');
    $('#links a[data-link=about-pp]').addClass('active');
    $('body').removeClass().addClass('s1');
  } else if (scrollPos < heightP1) {
    $('#links a').removeClass('active');
    $('#links a[data-link=splash]').addClass('active');
    $('body').removeClass().addClass('s0');
  }
});

$('a[data-link]').on('click', function(e){
  e.preventDefault();
  $('#links').removeClass('active');
  var target = "#" + $(this).data("link");
  $('html, body').animate({ scrollTop: $(target).offset().top }, 1500, 'easeInOutQuart');
});


$('a[data-dropdown="toggle"]').on("click", function(e){
  e.preventDefault();
  $('ul#links').toggleClass('active');
});

$(window).resize(resizeWindow);

$(document).ready(function() { resizeWindow() });
