# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.or
$ ->
    #username input
    $("input[name=username]").keyup ->
      t = $("input[name=username]").val()
      if t.length < 3 || t.length > 20 || !t.match(/^[\w_]*$/)
        $('#user_error').html('<img src="/assets/redX.png" width="15px" style="padding-left: 5%;">')
      else
        $('#user_error').html('<img src="/assets/greencheck.png" width="15px" style="padding-left: 5%;">')
     #password input 
     $("input[name=password]").keyup ->
      t = $("input[name=password]").val()
      if t.length < 5 || t.length > 30
        $('#password_error').html('<img src="/assets/redX.png" width="15px" style="padding-left: 5%;">')
      else
        $('#password_error').html('<img src="/assets/greencheck.png" width="15px" style="padding-left: 5%;">')
     # verify password input    
     $("input[name=password_check]").keyup ->
        t = $("input[name=password_check]").val()
        if t != $("input[name=password]").val()
          $('#password_check_error').html('<img src="/assets/redX.png" width="15px" style="padding-left: 5%;">')
        else
          $('#password_check_error').html('<img src="/assets/greencheck.png" width="15px" style="padding-left: 5%;">')   
