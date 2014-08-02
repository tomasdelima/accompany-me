jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

$(document).ready(function(){

    $('.wysihtml5').each(function(i, elem) {
      $(elem).wysihtml5();
    });

})
