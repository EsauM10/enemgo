$(function () {
  var startScroll = 0;
  var heightHeader = $('.masthead').height();
  var heightNav = $('.main-navbar').height();

  $(document).scroll(function () {
    startScroll = $(this).scrollTop();
    var navHome = $('#nav-home');

    if (startScroll >= (heightHeader - 60)) {
      navHome.removeClass('navbar-dark main-navbar')
                    .addClass('navbar-default bg-white fixed-top brd-b-1')
                    .slideDown();
    } else {
      if (startScroll == 0) {
        navHome.show();
      } else {
        navHome.slideUp(function () {
          $(this).removeClass('navbar-default bg-white fixed-top brd-b-1')
                 .addClass('navbar-dark main-navbar')
        });
      }
    }
  });
});
