jQuery(function() {
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
})

$(document).ready(function(){
  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5()
  })

  $('.datepicker').datepicker({
    format: "dd/mm/yyyy",
    autoclose: true,
    language: 'pt-BR',
  })

  $('.expandable-list').hide()
  $('.expanded .expandable-list').show()
  $('.expanded .count').hide()

  $('.expandable').on('click', function(elem){
    var target = $(elem.currentTarget).attr('data-target')
    $('.expandable-list.' + target).toggle(300)
    $('.count.' + target).fadeToggle(300)
  })
})
