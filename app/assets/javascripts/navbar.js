$(document).on('turbolinks:load', function() {
  "use strict";

  $('#nav-home a[data-action="scroll-landing"]').click(function(e) {
    e.preventDefault();
    var target = $(this).attr('href').slice(1);
    
    if (target.length == 0) {
      scrolling($('body'));
      return true;
    }

    $('section').each(function() {
      var s = $(this);
      if (s.attr('id') == target) {
        scrolling(s);
      }
    })

  });

  $('#nav-home .nav-link').click(function() {
    $('.navbar-collapse').collapse('hide');
  });

  $('body').scrollspy({
    target: '#nav-home',
    offset: 60
  });

  var scrolling = function(t) {
    $('html, body').animate({
      scrollTop: (t.offset().top - 60)
    }, 800);
  }

});
