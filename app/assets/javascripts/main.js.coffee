# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setHash = (hash) ->
  window.location.hash = hash

  catName = if (typeof(cat) != 'undefined' && cat) then ('.cat-' + cat) else ''

$ ->
  return unless $('body').hasClass 'main'

  $('#gallery').masonry({ itemSelector: '.work' })

  $('#gallery header .category').click( ->
    id = $(this).data('id')
    arrangeWorks(id)
  )

  $('#gallery .work').click( ->
    modal = $(this)
      .clone()
      .addClass('original')
      .addClass('popup-modal-dismiss')
    img = modal.find('img')
    src = img.prop('src').replace('preview', 'original')
    img.prop('src', src);

    $('#popup-modal')
      .empty()
      .append(modal)

    setHash($(this).prop('class').match(/work-\d+/)[0])
  )
  .magnificPopup {
    type: 'inline',
    preloader: false,
    modal: true,
    position: 'auto',
    alignTop: true,
    mainClass: 'mfp-fade',
    callbacks: {
      close: ->
        setHash('')
    }
  }

  window.location.hash.substr(1) && $("#gallery .#{window.location.hash.substr(1)}").click()


$(document).on 'click', '.popup-modal-dismiss', (e) ->
  e.preventDefault()
  $.magnificPopup.close()
