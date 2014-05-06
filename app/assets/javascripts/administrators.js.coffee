# Events binding

$(document).ready ->
  $('#addAdminButton').click -> addAdminClick()

# Events Handlers

addAdminClick = ->
  if(validateAddAdminForm())
    name = $("#nameVal").val()
    email = $("#emailVal").val()
    password = $("#password1Val").val()
    if(addAdmin(name, email, password))
      $("#addAdmin input").prop "disabled", true
      $("#addAdmin button").hide()
      addSuccessNotification("Administrador adicionado!")

# API calls

@addAdmin = (name, email, password) ->
  $.ajaxSetup async: false
  data = $.getJSON("/administrators/create",
    name: name
    email: email
    password: password
  )
  $.ajaxSetup async: true

# Form Validation

@validateAddAdminForm = ->
  clearNotifications()
  name = $("#nameVal").val()
  email = $("#emailVal").val()
  password1 = $("#password1Val").val()
  password2 = $("#password2Val").val()
  if name.length is 0
    addErrorNotification("Falta o nome!")
    return false
  else if email.length is 0
    addErrorNotification("Falta o email!")
    return false
  else if !emailIsValid(email)
    addErrorNotification("Email inválido!")
    return false
  else if password1.length is 0
    addErrorNotification("Falta a password!")
    return false
  else if password1.length < 5
    addErrorNotification("A password tem que ter no mínimo 5 caracteres")
    return false
  else if password2.length is 0
    addErrorNotification("Falta confirmar a password!")
    return false
  else if password1 != password2
    addErrorNotification("Passwords diferentes!")
    return false
  true
