function enableWysiwyg () {
  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5()
  })
}

function enableDatepickers () {
    $('.datepicker').datepicker({
    format: "dd/mm/yyyy",
    autoclose: true,
    language: 'pt-BR',
  })
}

function enableExpandableLists () {
  $('.expandable-list').hide()

  $('.expandable').on('click', function(elem){
    target = $(elem.currentTarget).attr('data-target')
    $('.expandable-list.' + target).toggle(300)
    $('.count.' + target).fadeToggle(300)
  })
}