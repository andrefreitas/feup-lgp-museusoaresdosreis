# Events binding
$(window).ready ->
  $('#addAdminButton').click -> addAdminClick()
  $('#updateAdminButton').click -> updateAdminClick(this)
  $('.admin .delete').click -> deleteAdminClick(this)

# Events Handlers

addAdminClick = ->
  if(validateAddAdminForm())
    name = $("#nameVal").val()
    email = $("#emailVal").val()
    password = $("#password1Val").val()
    result = addAdmin(name, email, password)
    if (result[0] is "emailExists")
      addErrorNotification("O email já existe!")
    else
      $("#addAdmin input").prop "disabled", true
      $("#addAdmin button").hide()
      addSuccessNotification("Administrador adicionado!")

updateAdminClick = (elem) ->
  if(validateUpdateAdminForm())
    adminID = $(elem).attr("admin")
    name = $("#nameVal").val()
    email = $("#emailVal").val()
    password = $("#password1Val").val()
    result = updateAdmin(adminID, name, email, password)
    if (result[0] is "emailExists")
      addErrorNotification("O email já existe!")
    else
      $("#editAdmin input").prop "disabled", true
      $("#editAdmin button").hide()
      addSuccessNotification("Administrador atualizado!")

deleteAdminClick = (elem) ->
  adminDiv = $(elem).parent().parent()
  adminID = $(adminDiv).attr("id")
  adminName = $(adminDiv).children(".name").first().html()
  confirmation = confirm("Pretende mesmo eliminar " + adminName + " ?")
  if confirmation is true
    $(adminDiv).fadeOut()
    deleteAdmin(adminID)


# API calls

@addAdmin = (name, email, password) ->
  $.ajaxSetup async: false
  data = $.post("/administrators.json",
    name: name
    email: email
    password: password
  )
  $.ajaxSetup async: true
  data.responseJSON

@updateAdmin = (adminID, name, email, password) ->
  data = $.ajax({
    url: '/administrators/' + adminID + '.json',
    type: 'PUT',
    data: {
      name : name
      email: email
      password: password
    },
    async: false
  })
  data.responseJSON

@deleteAdmin = (adminID) ->
  $.ajax({
    url: '/administrators/' + adminID,
    type: 'DELETE',
    async: false
  })


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

@validateUpdateAdminForm = ->
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
    else if password1.length > 0 and password1.length < 5
      addErrorNotification("A password tem que ter no mínimo 5 caracteres")
      return false
    else if password1.length >= 5 and password1 != password2
      addErrorNotification("Passwords diferentes!")
      return false
    return true
