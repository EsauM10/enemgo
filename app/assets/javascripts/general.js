// navbar scroll
// Source: https://blackrockdigital.github.io/startbootstrap-scrolling-nav/
$(function() {
  "use strict"; // Start of use strict

  // Smooth scrolling using jQuery easing
  $('a.smooth-scr[href*="#"]:not([href="#"])').click(function(event) {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') &&
      location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {

        $('html, body').animate({
          scrollTop: (target.offset().top - 54)
        }, 800);
        return false;
      }
    }
  });

  // Closes responsive menu when a scroll trigger link is clicked
  $('.smooth-scr').click(function() {
    $('.navbar-collapse').collapse('hide');
  });

  // Activate scrollspy to add active class to navbar items on scroll
  $('body').scrollspy({
    target: '#nav-home',
    offset: 54
  });

}); // End of use strict
