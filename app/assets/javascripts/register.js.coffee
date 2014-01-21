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
      if t == ""
        $('#user_error').html('')

     #password input 
     $("input[name=password]").keyup ->
      t = $("input[name=password]").val()
      s = $("input[name=password_check]").val()
      if t.length < 6 || t.length > 30
        $('#password_error').html('<img src="/assets/redX.png" width="15px" style="padding-left: 5%;">')
      else
        $('#password_error').html('<img src="/assets/greencheck.png" width="15px" style="padding-left: 5%;">')
      if s != t
          $('#password_check_error').html('<img src="/assets/redX.png" width="15px" style="padding-left: 5%;">')
        else
          $('#password_check_error').html('<img src="/assets/greencheck.png" width="15px" style="padding-left: 5%;">')
      if s == ""
          $('#password_check_error').html('')
      if t == ""
          $('#password_error').html('')

     # verify password input    
     $("input[name=password_check]").keyup ->
        t = $("input[name=password_check]").val()
        if t != $("input[name=password]").val()
          $('#password_check_error').html('<img src="/assets/redX.png" width="15px" style="padding-left: 5%;">')
        else
          $('#password_check_error').html('<img src="/assets/greencheck.png" width="15px" style="padding-left: 5%;">')
        if t == ""
          $('#password_check_error').html('')

     #email
     $("input[name=email]").keyup ->
        t = $("input[name=email]").val()
        s = $("input[name=email_check]").val()
        if !t.match(/^[\w\.]+@{1}\w+(\.+[a-z]{2,4})?(\.[a-z]{2,4})$/)  
          $('#email_error').html('<img src="/assets/redX.png" width="15px" style="padding-left: 5%;">')
        else
          $('#email_error').html('<img src="/assets/greencheck.png" width="15px" style="padding-left: 5%;">')
        if s != t
          $('#email_check_error').html('<img src="/assets/redX.png" width="15px" style="padding-left: 5%;">')
        else
          $('#email_check_error').html('<img src="/assets/greencheck.png" width="15px" style="padding-left: 5%;">')
        if s == ""
          $('#email_check_error').html('')
        if t == ""
          $('#email_error').html('')

     #email check
     $("input[name=email_check]").keyup ->
        t = $("input[name=email_check]").val()
        if t != $("input[name=email]").val()
          $('#email_check_error').html('<img src="/assets/redX.png" width="15px" style="padding-left: 5%;">')
        else
          $('#email_check_error').html('<img src="/assets/greencheck.png" width="15px" style="padding-left: 5%;">')
        if t == ""
          $('#email_check_error').html('')
