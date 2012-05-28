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
<<<<<<< HEAD
//= require ajaxform
//= require jquery_ujs
=======
>>>>>>> 09af7109fb3c68ca17752ecdb3691dcb7e7b9812
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require jquery.ui.datepicker
//= require_tree .
<<<<<<< HEAD
$(document).ready (function() {

    $(document).on("change", ".ptid", function(){

          alert($(".ptid :selected").val());

        var selid = $(".ptid :selected").val();

        // make a POST call and replace the content
       // $.post("getPSub", function(data) {
       //
       // });

        $.ajax({
            type: 'POST',
            url: 'getPSub',
            data: {psubid: selid},
        })
    });

});
=======

>>>>>>> 09af7109fb3c68ca17752ecdb3691dcb7e7b9812
