function toggleAccompaniment () {
  $('.box.accompaniment > ul').slideUp(0)

  $('.box.accompaniment > h2').on('click', function (e) {
    var target = $(e.currentTarget),
        icon = target.find('i'),
        elem = target.next()
    $(elem).slideToggle(500)
    $(icon).toggleClass('up')
  })
}

$(document).ready(function(){
  toggleAccompaniment()
})

$(document).on('page:load', function () {
  toggleAccompaniment()
})