
$(document).ready ->
  $('#loginButton').click -> loginClick()
  $('#logoutButton').click -> logoutClick()

# Events Handlers

@loginClick = ->
  email = $('#emailVal').val()
  password = $('#passwordVal').val()
  if(validateLoginForm())
    if(login(email, password))
      location.reload()
    else
      addErrorNotification("Login inválido!")

@logoutClick = ->
  logout()
  location.reload()

# API calls

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

# Form Validation

@validateLoginForm = ->
  email = $('#emailVal').val()
  password = $('#passwordVal').val()
  if(email.length is 0)
    addErrorNotification("Escreva o email!")
    return false
  else if(!emailIsValid(email))
    addErrorNotification("Email inválido!")
    return false
  else if(password.length is 0)
    addErrorNotification("Escreva a password!")
    return false
  clearErrorNotifications()
  return true

@addErrorNotification = (message) ->
  clearErrorNotifications()
  $(".notifications").append "<div class='error'>#{message}</div>"

@clearErrorNotifications = ->
  $('.notifications').empty()

@emailIsValid = (email) ->
  emailPattern = /^([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})$/i
  if email.match(emailPattern) then true else false