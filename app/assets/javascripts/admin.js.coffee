# Events Binding

$(document).ready ->
  $('#loginButton').click -> loginClick()
  $('#logoutButton').click -> logoutClick()
  $('#forgotPasswordButton').click -> generatePasswordClick()
  $('#generatePasswordButton').click -> generatePasswordClick()

# Events Handlers

loginClick = ->
  if(validateLoginForm())
    email = $('#emailVal').val()
    password = $('#passwordVal').val()
    if(login(email, password))
      location.reload()
    else
      addErrorNotification("Login inválido!")

logoutClick = ->
  logout()
  location.reload()

generatePasswordClick = ->
  email = $('#emailVal').val()
  if(email.length is 0)
    addErrorNotification("Escreva o email!")
    return false
  else if(!emailIsValid(email))
    addErrorNotification("Email inválido!")
    return false
  generatePassword(email)
  
  

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

@generatePassword = (email) ->
  $.ajaxSetup async: false
  data = $.getJSON("/generatePassword.json", email: email)
  $.ajaxSetup async: true
  jsonVal = $.parseJSON(data["responseText"])
  if(jsonVal['result'] is "invalid")
     addErrorNotification("Email invalido")
  else
     addSuccessNotification("Email foi Enviado")
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
  clearNotifications()
  return true


@addErrorNotification = (message) ->
  clearNotifications()
  $(".notifications").append "<div class='error'>#{message}</div>"

@addSuccessNotification = (message) ->
  clearNotifications()
  $(".notifications").append "<div class='success'>#{message}</div>"

@clearNotifications = ->
  $('.notifications').empty()

@emailIsValid = (email) -> 
  emailPattern = /^([\w.-]+)@([\w.-]+)\.([a-zA-Z.]{2,6})$/i
  if email.match(emailPattern) then true else false

