function toggleAccompaniment () {
  $('.accompaniments').on('click', function (e) {
     elem = $(e.currentTarget).children('ul')
    $(elem).toggleClass('hidden')
  })
}

$(document).ready(function(){
  toggleAccompaniment()
})

$(document).on('page:load', function () {
  toggleAccompaniment()
})