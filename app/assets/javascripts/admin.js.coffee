
$(document).ready ->
  $('#loginButton').click -> loginClick()


@loginClick = ->
  email = $('#emailVal').val()
  password = $('#passwordVal').val()

@login = (email, password) ->
  $.ajaxSetup async: false
  data = $.getJSON("/login.json",
    email: email
    password: password
  )
  $.ajaxSetup async: true
  $.parseJSON(data["responseText"])["result"] is "ok"

@logout = ->
  $.ajaxSetup async: false
  data = $.getJSON("/logout.json")
  $.ajaxSetup async: true
  $.parseJSON(data["responseText"])["result"] is "ok"