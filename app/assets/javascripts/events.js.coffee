# Events Binding
$(document).ready ->

  $('.event .delete').click -> deleteEventClick(this)
  $("#image1").change -> readImage1 this
  $("#image2").change -> readImage2 this
  $("#image3").change -> readImage3 this
  $("#image1Val").change -> readImage1 this
  $("#image2Val").change -> readImage2 this
  $("#image3Val").change -> readImage3 this


# Form Validations
@validateAddEvent = ->
  clearNotifications()
  data = {}
  data["title"]= $("#titleVal").val()
  data["date"]= $("#dateVal").val()
  data["content"]= $("#contentVal").val()
  data["image1"] = $("#image1Val").val()
  data["image2"] = $("#image2Val").val()
  data["image3"] = $("#image3Val").val()
  data["caption1"] = $("#caption1Val").val()
  data["caption2"] = $("#caption2Val").val()
  data["caption3"] = $("#caption3Val").val()

  if(data["title"].length is 0)
    addErrorNotification("Falta o título")
    return false
  else if(data["date"].length is 0)
    addErrorNotification("Falta a data")
    return false

  if(data["image1"].length > 0 and !imageIsValid(data["image1"]))
    addErrorNotification("As imagens apenas podem ser PNG ou JPEG")
    return false

  if(data["image2"].length > 0 and !imageIsValid(data["image2"]))
    addErrorNotification("As imagens apenas podem ser PNG ou JPEG")
    return false

  if(data["image3"].length > 0 and !imageIsValid(data["image3"]))
    addErrorNotification("As imagens apenas podem ser PNG ou JPEG")
    return false

  console.log(data)
  return true

@validateEditEvent = ->
  clearNotifications()
  data = {}
  data["title"]= $("#titleVal").val()
  data["date"]= $("#dateVal").val()
  data["content"]= $("#contentVal").val()
  data["image1"] = $("#image1Val").val()
  data["image2"] = $("#image2Val").val()
  data["image3"] = $("#image3Val").val()
  data["caption1"] = $("#caption1Val").val()
  data["caption2"] = $("#caption2Val").val()
  data["caption3"] = $("#caption3Val").val()

  if(data["title"].length is 0)
    addErrorNotification("Falta o título")
    return false
  else if(data["date"].length is 0)
    addErrorNotification("Falta a data")
    return false

  if(data["image1"].length > 0 and !imageIsValid(data["image1"]))
    addErrorNotification("As imagens apenas podem ser PNG ou JPEG")
    return false

  if(data["image2"].length > 0 and !imageIsValid(data["image2"]))
    addErrorNotification("As imagens apenas podem ser PNG ou JPEG")
    return false

  if(data["image3"].length > 0 and !imageIsValid(data["image3"]))
    addErrorNotification("As imagens apenas podem ser PNG ou JPEG")
    return false

  if(data["image1"].length > 0 and data["caption1"].length is 0)
    addErrorNotification("A imagem precisa de ter uma legenda")
    return false

  if(data["image2"].length > 0 and data["caption2"].length is 0)
    addErrorNotification("A imagem precisa de ter uma legenda")
    return false

  if(data["image3"].length > 0 and data["caption3"].length is 0)
    addErrorNotification("A imagem precisa de ter uma legenda")
    return false

  console.log(data)
  return true


imageIsValid = (path) ->
  /.(png|jpg|jpeg)$/i.test(path)

deleteEventClick = (elem) ->
  eventDiv = $(elem).parent().parent()
  eventID = $(eventDiv).attr("id")
  confirmation = confirm("Pretende mesmo eliminar este evento?")
  if confirmation is true
    $(eventDiv).fadeOut()
    deleteEvent(eventID)
    addSuccessNotification("Evento apagado com sucesso!")

deleteEvent = (eventID) ->
  $.ajax({
    url: '/events/' + eventID,
    type: 'DELETE',
    async: false
  })

@readImage1 = (input) ->
  if input.files and input.files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      $("#preview1").attr "src", e.target.result
      return
    $("#preview1").attr "alt", input.files[0].name
    $("#name-img1").text(input.files[0].name)
    reader.readAsDataURL input.files[0]
  return

@readImage2 = (input) ->
  if input.files and input.files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      $("#preview2").attr "src", e.target.result
      return
    $("#preview2").attr "alt", input.files[0].name
    $("#name-img2").text(input.files[0].name)
    reader.readAsDataURL input.files[0]
  return

@readImage3 = (input) ->
  if input.files and input.files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      $("#preview3").attr "src", e.target.result
      return
    $("#preview3").attr "alt", input.files[0].name
    $("#name-img3").text(input.files[0].name)
    reader.readAsDataURL input.files[0]
  return