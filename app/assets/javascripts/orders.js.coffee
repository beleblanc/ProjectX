# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#order_department_operation_id').parent().parent().hide()
  operations = $('#order_department_operation_id').html()
  $('#order_department').change ->
    department = $('#order_department :selected').text()
    options = $(operations).filter("optgroup[label='#{department}']").html()
    if options
      $('#order_department_operation_id').html(options)
      $('#order_department_operation_id').parent().parent().show()
    else
      $('#order_department_operation_id').empty()
      $('#order_department_operation_id').parent().parent().hide()


