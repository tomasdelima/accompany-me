$(document).ready(function(){
  $('.accompaniments').on('click', function (e) {
     elem = $(e.currentTarget).children('ul')
    $(elem).toggleClass('hidden')
  })
})