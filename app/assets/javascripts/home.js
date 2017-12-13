$(function () {
  var startScroll = 0;
  var heightHeader = $('.masthead').height();
  var heightNav = $('#nav-home').height();
  var intoClss = 'navbar-default bg-white fixed-top';

  $(document).scroll(function() {
    startScroll = $(this).scrollTop();

    if (startScroll >= (heightHeader - heightNav)) {
      $('#nav-home').removeClass('navbar-dark main-navbar')
                    .addClass('navbar-default bg-white fixed-top brd-b-1 fadeIn');
    } else {
      $('#nav-home').addClass('navbar-dark main-navbar fadeOutUp')
                    .removeClass('navbar-default bg-white fixed-top brd-b-1 fadeOutUp');
    }
  });
});
