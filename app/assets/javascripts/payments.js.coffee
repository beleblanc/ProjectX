# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(document).on "change", "#pay_in_full", ->

    if $(this).is(':checked')
      $.ajax(
        {
          type : "POST",
          url: "/invoices/remaining_balance",
          dataType: 'json',
          data: {id : $('#payment_invoice_id').val()}
          success: (data)->
            if data.total
              $('#payment_amount').val(data.total)
              $('#payment_amount').attr('readonly','true')

        })
    else
      $('#payment_amount').removeAttr('readonly')

