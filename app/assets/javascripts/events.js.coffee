# Events Binding
$(document).ready ->

  $("#datepicker").datepicker({
    dateFormat: 'dd/mm/yy',
    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
    nextText: 'Próximo',
    prevText: 'Anterior'})

  $('.event .delete').click -> deleteEventClick(this)
  $("#image1").change -> readImage1 this
  $("#image2").change -> readImage2 this
  $("#image3").change -> readImage3 this


# Form Validations
@validateAddEvent = ->
  clearNotifications()
  data = {}
  data["title"]= $("#titleVal").val()
  data["date"]= $("#datepicker").val()
  data["content"]= $("#contentVal").val()
  data["image1"] = $("#image1Val").val()
  data["image2"] = $("#image2Val").val()
  data["image3"] = $("#image3Val").val()

  if(data["title"].length is 0)
    addErrorNotification("Falta o título")
    return false
  else if(data["date"].length is 0)
    addErrorNotification("Falta a data")
    return false
  else if(data["content"].length is 0 )
    addErrorNotification("Falta o texto")
    return false
  else if((data["image1"] + data["image2"] + data["image3"]).length is 0 )
    addErrorNotification("Adicione pelo menos uma imagem")
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

imageIsValid = (path) ->
  /.(png|jpg|jpeg)$/i.test(path)

deleteEventClick = (elem) ->
  eventDiv = $(elem).parent().parent()
  eventID = $(eventDiv).attr("id")
  confirmation = confirm("Pretende mesmo eliminar este evento?")
  if confirmation is true
    $(eventDiv).fadeOut()
    deleteEvent(eventID)

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
    $("#name-img1").text(input.files[0].name)
    reader.readAsDataURL input.files[0]
  return

@readImage2 = (input) ->
  if input.files and input.files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      $("#preview2").attr "src", e.target.result
      return
    $("#name-img2").text(input.files[0].name)
    reader.readAsDataURL input.files[0]
  return

@readImage3 = (input) ->
  if input.files and input.files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      $("#preview3").attr "src", e.target.result
      return
    $("#name-img3").text(input.files[0].name)
    reader.readAsDataURL input.files[0]
  return