$(function () {
  $(document).on('click', '.file-browser', function() {
    var $browser = $(this);
    if ( $browser.hasClass('form-control') ) {
      setTimeout(function(){
        $browser.closest('.file-group').find('[type="file"]').trigger('click');
      },300);
    }
    else {
      var file = $browser.closest('.file-group').find('[type="file"]');
      file.on( 'click', function(e) {
       e.stopPropagation();
      });
      file.trigger('click');
    }
  });

  // Event to change file name after file selection
  $(document).on('change', '.file-group [type="file"]', function() {

    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    if (file) {
      reader.readAsDataURL(file)
    }
    reader.onloadend = function () {
      if (avatarExists()) {
        $('#avatar-img').fadeOut('fast', function() {
          $(this).attr('src', reader.result).fadeIn('fast')
        })
      } else {
        $('#content-avatar').empty()
                            .append("<img src='" + reader.result + "' id='avatar-img' />")
                            .fadeIn('fast');
      }
      $('#remove_avatar')[0].checked = false;
    }
  });

  $(document).on('click', '.remove-avatar', function(event) {
    event.preventDefault();
    if (avatarExists()) {
      $('#remove_avatar')[0].checked = true;
      $('#content-avatar').empty().fadeOut('fast', function() {
        $(this).append('VS').fadeIn();
      });

    }
  })

  var avatarExists = function () {
    return $('#avatar-img').length > 0
  }

});
