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
  data["date"]= $("#datepicker").val()
  data["text"]= $("#text").val()
  data["local"] = $("#localInput").val()
  data["image1"] = $("#image1").val()
  data["image2"] = $("#image2").val()
  data["image3"] = $("#image3").val()

  if(data["date"].length is 0)
    addErrorNotification("Falta a data")
    return false
  else if(data["local"].length is 0)
    addErrorNotification("Falta a localização")
    return false
  else if(data["text"].length is 0 )
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