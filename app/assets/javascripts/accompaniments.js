function toggleAccompaniment () {
  $('h2 i').on('click', function (e) {
    var icon = $(e.currentTarget)
        elem = icon.parent().parent().find('ul')
    $(elem).toggleClass('hidden')
    $(icon).toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-up')
  })
}

$(document).ready(function(){
  toggleAccompaniment()
})

$(document).on('page:load', function () {
  toggleAccompaniment()
})