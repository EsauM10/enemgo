function toggleSource(id) {
  var src = $('#' + id).toggle();
  var isVisible = src.is(':visible');
  $('#l_' + id).html(isVisible ? 'hide' : 'show');
}

window.highlight = function(url) {
  var hash = url.match(/#([^#]+)$/);
  if (hash) {
    var parent = document.querySelector('a[name=' + hash[1] + ']').parentElement;

    parent.classList.add('highlight');

    setTimeout(function() {
      parent.classList.remove('highlight');
    }, 1000);
  }
};

$(function() {
  highlight('#' + location.hash);
  $('.description pre').each(function() {
    hljs.highlightBlock(this);
  });
});
