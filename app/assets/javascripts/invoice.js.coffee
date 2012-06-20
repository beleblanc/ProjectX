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
      minLength: 2
      autoFocus: true
      change: (event, ui) ->
        $.ajax({
          type: 'POST',
          cache: false,
          url: "/invoices/department_operation_price",
          dataType: "json",
          data: {key_string: ui.item.value, person_medical_aid_id: $('#invoice_person_medical_aid_id').val()},
          success: (data) ->
            $parent = $(event.currentTarget).closest('tr')
            $($parent).find('.line_unit_cost').val(data.price)
            $($parent).find('.line_quantity').val("1.0")
            $($parent).find('.line_total').val(data.price)
            calculate_invoice()

          }
        )

  $('.autocomplete').autocomplete
    source: $('.autocomplete').data('autocomplete-source')
    minLength: 2
    autoFocus: true
    change: (event, ui) ->
      $.ajax({
        type: 'POST',
        cache: false,
        url: "/invoices/department_operation_price",
        dataType: "json",
        data: {key_string: ui.item.value, person_medical_aid_id: $('#invoice_person_medical_aid_id').val()},
        success: (data) ->
          $parent = $(event.currentTarget).closest('tr')
          $($parent).find('.line_unit_cost').val(data.price)
          $($parent).find('.line_quantity').val("1.0")
          $($parent).find('.line_total').val(data.price)
          calculate_invoice()

        }
      )


calculate_invoice = ->
  line_total = null
  invoice_total = 0
  discount = Number((1 - (Number($('#invoice_discount').val()) / 100)).toPrecision())
  $('.invoice_row').each(->
    line_total = Number($(this).find('.line_unit_cost').val()) * Number($(this).find('.line_quantity').val())
    line_total = discount * line_total
    $(this).find('.line_total').val(line_total)
  )
  $('.line_total').each(->
    invoice_total += Number($(this).val())
  )
  $('#invoice_total').val(invoice_total)
