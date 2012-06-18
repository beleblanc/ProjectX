# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('.invoice-form').on 'click', '.add_invoice_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#invoice-table tbody').append($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    $('.autocomplete').autocomplete
      source: $('.autocomplete').data('autocomplete-source')
      change: (event, ui) ->
        alert($(ui.item).text())

  $('.autocomplete').autocomplete
    source: $('.autocomplete').data('autocomplete-source')
    change: (event, ui) ->
      alert(ui.item.label)