# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#peopleData').dataTable()
  $('.datepicker').datepicker({ changeYear: true });


#jQuery ->

#  $(window).bind('onhashchange', ->
#      vari = /new/
#      if document.url.match vari
#        $.ajax { url: "people/destroy_dependency" })

