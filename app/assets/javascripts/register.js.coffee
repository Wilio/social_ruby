# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.or
$ ->
    $("input[name=username]").keyup ->
      t = $("input[name=username]").val()
      if t.length < 3
        $('#user_error').html("too short")
      else
        $('#user_error').html("")

     $("input[name=password]").change ->
      t = $("input[name=password]").val()
      if t.length < 5
        $('#password_error').html("too short")
      else
        $('#password_error').html("")
    
