$(function () {
  $(document).on('click', '.sidebar .nav-link[data-toggle="submenu"]', function(e){
      e.preventDefault();
      var $submenu = $(this).next('.sidebar-submenu');
      if ($submenu.length < 1)
        return;
      $submenu.slideToggle('collapse');
    });
});
