# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  return unless $('body').hasClass 'main'

  $('#gallery header .category').click ->
    id = $(this).data 'id'
    if !id
      $('.work').fadeIn 200
    else
      $('.work').fadeOut 200
      $(".work.cat-#{id}").fadeIn 200

  $('#info .handle').click ->
    $('#info').toggleClass 'off', 500, 'easeInOutQuint'

  $(window).scroll ->
    $('#info .handle').animate {top: $(window).scrollTop() + 150 }, 10