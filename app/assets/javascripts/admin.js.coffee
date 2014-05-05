
$(document).ready ->
  window.images = 0 # Counter for uploading images
  $('#loginButton').click -> loginClick()
  $('#logoutButton').click -> logoutClick()
  $('#addAdminButton').click -> addAdminClick()
  $("#adminPhoto").change -> previewAdminPhoto(this)
  $("#addImagesButton").click -> addImagesClick()


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

addAdminClick = ->
  if(validateAddAdminForm())
    name = $("#nameVal").val()
    email = $("#emailVal").val()
    password = $("#password1Val").val()
    if(addAdmin(name, email, password))
      $("#addAdmin input").prop "disabled", true
      $("#addAdmin button").hide()
      addSuccessNotification("Administrador adicionado!")

previewAdminPhoto = (elem)->
  previewImage(elem,"#previewAdminPhoto")

previewImage = (input, where) ->
  if input.files and input.files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      $(where).attr "src", e.target.result
      return

    reader.readAsDataURL input.files[0]
  return

# DOM
@addImagesClick = ->
  window.images = window.images + 1
  if window.images < 3
    $(".imagesArea").append('<input type="file" name="image' + window.images + '"/>')



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

@addAdmin = (name, email, password) ->
  $.ajaxSetup async: false
  data = $.getJSON("/admin/create",
      name: name
      email: email
      password: password
  )
  $.ajaxSetup async: true


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
