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
  var originalNode = $('#content-avatar');
  var firstElem = originalNode.children(':first');
  // Event to change file name after file selection
  $(document).on('change', '.file-group [type="file"]', function() {

    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    if (file) {
      reader.readAsDataURL(file)
    }
    reader.onloadend = function() {
      if (avatarExists()) {
        $('#avatar-img').fadeOut('fast', function() {
          $(this).attr('src', reader.result).fadeIn('fast')
        })
      } else {
        $('#content-avatar').html(
          "<div class='"+ firstElem[0].className +"'>" +
          "<img src='" + reader.result + "' id='avatar-img' />" +
          "</div>"
        ).fadeIn('fast');
      }
      $('#remove_avatar')[0].checked = false;
    }
  });

  $(document).on('click', '.remove-avatar', function(event) {
    event.preventDefault();
    if (avatarExists()) {
      $('#remove_avatar')[0].checked = true;

      $('#content-avatar').fadeOut('fast', function() {
        $(this).html(
          originalNode.children(':first').html(
            "<span>"+ firstElem.data('text') +"</span>")[0]
          )
        )
      }).fadeIn()
    } else {
      $('#content-avatar').fadeOut('fast').html(firstElem[0]).fadeIn()
    }
  })

  var avatarExists = function () {
    return $('#avatar-img').length > 0
  }

});
