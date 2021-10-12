import "jquery"

$(document).ready(function() {
  $('#nav li.category').click(function() {
    const cl = $(this).attr('class')

    if (!cl) {
      return false
    }

    const match = cl.match(/category-(\d{1,2})/)

    if (!match || match.length < 2) {
      $('#gallery .work').show()
      console.log(1)
      return false
    }

    const num = match[1]

    if (!num) {
      console.log(2)
      return false
    }

    $('#gallery .work').hide()
    $('#gallery .work.cat-' + num).show()

    return false
  })
})
