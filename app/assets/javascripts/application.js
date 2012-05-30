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
//= require_tree .
var dataHolder = null;
$(document).ready (function() {

    $(document).on("change", ".ptid", function(){

       var selid = $(".ptid :selected").val();

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
        $.ajax({ type: "POST",
            url : "getPSub",
            cache: false,
            dataType:'json',
            data: {psubid: selid},
            success: function(data){
                options = '';

                for (var i =0; i < data.length; i++)
                {
                    options += '<option value="'+data[i].id+'">'+data[i].name+'</option>';
                }
                dataHolder = options;
                 },
            error: function(xhr){ alert("The error is: "+xhr.statusText); } });


}); });



