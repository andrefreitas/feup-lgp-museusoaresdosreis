# Events Binding
$(document).ready ->

  changeLanguage(this)
  $('.translation').hide()
  $('.event .delete').click -> deleteEventClick(this)
  $('#languagesSelect').change -> changeLanguage(this) 
  $("#image1").change -> readImage1 this
  $("#image2").change -> readImage2 this
  $("#image3").change -> readImage3 this
  $("#image1Val").change -> readImage1 this
  $("#image2Val").change -> readImage2 this
  $("#image3Val").change -> readImage3 this


@changeLanguage = ->
  language = $('#languagesSelect :selected').text()
  eventID = $('#eventID').html()
  languageCode = $('#languagesSelect :selected').val()
  $.ajaxSetup async: false
  data = $.getJSON("/findTranslation.json",
    id: eventID
    language: languageCode
  )
  $.ajaxSetup async: true
  result = $.parseJSON(data["responseText"])["result"]
  if result is "found"
    contentText = $.parseJSON(data["responseText"])["content"]
    titleText = $.parseJSON(data["responseText"])["title"]
    images = $.parseJSON(data["responseText"])["images"]
    if images[0]
      titleimg1 = images[0].title
      caption1 = images[0].caption
    if images[1]
      titleimg2 = images[1].title
      caption2 = images[1].caption
    if images[2]
      titleimg3 = images[2].title
      caption3 = images[2].caption
    $("#translatedContentVal").text contentText
    $("#translatedTitleVal").val titleText
    $("#translatedTitleImg1Val").val titleimg1
    $("#translatedCaption1Val").text caption1
    $("#translatedTitleImg2Val").val titleimg2
    $("#translatedCaption2Val").text caption2
    $("#translatedTitleImg3Val").val titleimg3
    $("#translatedCaption3Val").text caption3
  else
    $('#translatedTitleVal').val ""
    $('#translatedContentVal').text ""
    $("#translatedTitleImg1Val").val ""
    $("#translatedCaption1Val").text ""
    $("#translatedTitleImg2Val").val ""
    $("#translatedCaption2Val").text ""
    $("#translatedTitleImg3Val").val ""
    $("#translatedCaption3Val").text ""
  if language is 'Português'
    $('.translation').hide()
  else
    $('.translation').show()
  return false

  

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

  language = $('#languagesSelect :selected').text()
  languageCode = $('#languagesSelect :selected').val()
  content = $("#translatedContentVal").val()
  title = $("#translatedTitleVal").val()
  translatedTitle_img1 = $("#translatedTitleImg1Val").val()
  translatedTitle_img2 = $("#translatedTitleImg2Val").val()
  translatedTitle_img3 = $("#translatedTitleImg3Val").val()
  translatedCaption1 = $("#translatedCaption1Val").val()
  translatedCaption2 = $("#translatedCaption2Val").val()
  translatedCaption3 = $("#translatedCaption3Val").val()
  eventID = $('#eventID').html()
  unless language is 'Português'
    $.ajaxSetup async: false
    data = $.getJSON("/updateTranslation",
    title: title
    content: content
    language: languageCode
    translatedTitle_img1: translatedTitle_img1
    translatedCaption1: translatedCaption1
    translatedTitle_img2: translatedTitle_img2
    translatedCaption2: translatedCaption2
    translatedTitle_img3: translatedTitle_img3
    translatedCaption3: translatedCaption3
    event: eventID
    )
  $.ajaxSetup async: true
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