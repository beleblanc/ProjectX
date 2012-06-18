// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require ajaxform
//= require jquery_ujs
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require jquery.ui.datepicker
//= require jquery.ui.autocomplete
//= require_tree .


//var dataHolder = null;
$(document).ready(function () {

    $(document).on("change", "#order_department_operation_id", function () {

        var selid = $("#order_department_operation_id :selected").val();

        // make a POST call and replace the content
        // $.post("getPSub", function(data) {
        //
        // });

        /*$.ajax({
         type: 'POST',
         url: 'getPSub',
         data: {"psubid": selid},
         success: function(data){  alert(data)}}
         );     */
        $.ajax({ type:"POST",
            url:"../department_operation/get_operation_price",
            cache:false,
            //dataType:'json',
            data:{department_operation:selid, person_id:$('#person_id').data('person_id'), medical_aid_plan_id:$('#person_id').data('medical_aid_plan_id') }//,

            // error: function(xhr){ alert("The error is: "+xhr.statusText); }
        });


    });
    $('.datepicker').datepicker({firstDay:1, changeYear:true, dateFormat:'yy-mm-dd', yearRange:'c-100:c', changeMonth:true });

});




