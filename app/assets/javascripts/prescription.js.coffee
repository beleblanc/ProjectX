# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  $('#new_prescription').on 'change', '#prescription_pharmacy_inventory', ->

    $.ajax({
      type:'POST',
      url:'/prescriptions/prescription_price',
      dataType:'json',
      data: {id: $('#prescription_pharmacy_inventory').val(), medical_aid_plan_id: $('#person_id').data('medical_aid_plan_id')},
      success: (data) ->
        if(data.price)
          $('#prescription_price').val(data.price)
          $('#prescription_price_display').html('<h3>E '+ data.price.toString()+'</h3>')


    })
