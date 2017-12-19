// Test sidebar show/hide
$(document).on('turbolinks:load', function() {
  $('#btn-preview').on('click', function () {
    $('body').toggleClass('sidebar-closed');
  });
});
