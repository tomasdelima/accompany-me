function toggleAccompaniment () {
  $('.accompaniments').on('click', function (e) {
      var elem  = $(e.currentTarget).children('ul')
    $('h2').on('click', function (e) {
      var elem2 = $(e.currentTarget).children('i')
      $(elem).toggleClass('hidden')
      $(elem2).toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-up')
    })
  })
}

$(document).ready(function(){
  toggleAccompaniment()
})

$(document).on('page:load', function () {
  toggleAccompaniment()
})