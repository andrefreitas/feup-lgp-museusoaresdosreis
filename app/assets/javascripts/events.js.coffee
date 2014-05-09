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
