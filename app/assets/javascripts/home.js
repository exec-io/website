var setWindowHeight = function() {
  var windowHeight = $(window).height();
  $('section.home-panel').css("min-height", windowHeight);
}

var getPanelHeights = function() {
  var heightP1 = $('section.home-panel:nth-child(10n+2)').height();
  var heightP2 = $('section.home-panel:nth-child(10n+3)').height() + heightP1;
  var heightP3 = $('section.home-panel:nth-child(10n+4)').height() + heightP2;
}

var resizeWindow = function() {
  setWindowHeight();
  getPanelHeights();
}

$(document).on('scroll', function(){
  var heightP1 = $('section.home-panel:nth-child(10n+2)').outerHeight();
  var heightP2 = $('section.home-panel:nth-child(10n+3)').outerHeight() + heightP1;
  var heightP3 = $('section.home-panel:nth-child(10n+4)').outerHeight() + heightP2;
  var scrollPos = $(window).scrollTop();
  if (scrollPos >= heightP3) {
    $('nav#links a').removeClass('active');
    $('nav#links a[data-link=locations]').addClass('active');
    $('body').removeClass('alpha beta').addClass('gamma');
  } else if (scrollPos >= heightP2) {
    $('nav#links a').removeClass('active');
    $('nav#links a[data-link=about-us]').addClass('active');
    $('body').removeClass('alpha gamma').addClass('beta');
  } else if (scrollPos >= heightP1) {
    $('nav#links a').removeClass('active');
    $('nav#links a[data-link=about-pp]').addClass('active');
    $('body').removeClass('beta gamma').addClass('alpha');
  } else if (scrollPos < heightP1) {
    $('nav#links a').removeClass('active');
    $('nav#links a[data-link=splash]').addClass('active');
    $('body').removeClass('alpha beta gamma');
  }
});

$('a.scroll-link').on('click', function(e){
  e.preventDefault();
  var target = "#" + $(this).data("link");
  $('html, body').animate({ scrollTop: $(target).offset().top }, 1500, 'easeInOutQuart');
});

$(window).resize(resizeWindow);

$(document).ready(function() { resizeWindow() });
