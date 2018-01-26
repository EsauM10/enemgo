$(document).on('turbolinks:load', function() {
  $('#btn-preview').on('click', function () {
    $('body').toggleClass('sidebar-closed');
  });

  $('.selectpicker').selectpicker({
    iconBase: 'ti',
    tickIcon: 'ti-check',
  });

  if ($('.content-pagination').length > 0) {
    var ps = new PerfectScrollbar('.content-pagination', {
      suppressScrollY: true,
      useBothWheelAxes: true,
    })
  }

  $('time').countDown({
    label_hh: '',
    label_mm: '',
    label_ss: ' restantes',
  })
});
