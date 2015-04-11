# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

setHash = (hash) ->
  window.location.hash = hash

arrangeWorks = (cat) ->
  $('#works .columns .work').appendTo $('#works .buff')

  catName = if (typeof(cat) != 'undefined' && cat) then ('.cat-' + cat) else ''

  cols = [
    {
      element: $('#works .col-1'),
      height: 0,
    },
    {
      element: $('#works .col-2'),
      height: 0,
    },
    {
      element: $('#works .col-3'),
      height: 0,
    }
  ]

  works = $("#works .buff .work#{catName}")
  .sort (a, b) -> parseInt($(a).data('order')) - parseInt($(b).data('order'))

  for w in works
    col = cols.sort((a, b) -> a.height - b.height)[0]
    col.element.append(w)
    col.height = col.element.height()

$ ->
  return unless $('body').hasClass 'main'
  console.profile()
  arrangeWorks()

  $('#gallery header .category').click ->
    id = $(this).data 'id'
    arrangeWorks(id)

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

  console.profileEnd()


$(document).on 'click', '.popup-modal-dismiss', (e) ->
  e.preventDefault()
  $.magnificPopup.close()
