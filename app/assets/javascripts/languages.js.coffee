# Events binding
$(window).ready ->
  $('#addLanguageButton').click -> addLanguageClick()
  $('.lang .delete').click -> deleteLanguageClick(this)

# Events Handlers

addLanguageClick = ->
  if(@validateAddLanguageForm())
    name = $("#nameVal").val()
    code = $("#codeVal").val()
    result = addLanguage(name, code)
    if (result[0] is "codeExists")
      addErrorNotification("O código de Idioma já existe!")
    else
      $("#addLanguage input").prop "disabled", true
      $("#addLanguage button").hide()
      addSuccessNotification("Idioma adicionado!")

deleteLanguageClick = (elem) ->
  langDiv = $(elem).parent().parent()
  langID = $(langDiv).attr("id")
  langName = $(langDiv).children(".name").first().html()
  confirmation = confirm("Pretende mesmo eliminar " + langName + " ?")
  if confirmation is true
    $(langDiv).fadeOut()
    @deleteLanguage(langID)
    addSuccessNotification("Língua removida!")

# API calls

@addLanguage = (name, code) ->
  $.ajaxSetup async: false
  data = $.post("/languages.json",
    name: name
    code: code
  )
  $.ajaxSetup async: true
  data.responseJSON


@deleteLanguage = (langID) ->
  $.ajax({
    url: '/languages/' + langID,
    type: 'DELETE',
    async: false
  })


# Form Validation

@validateAddLanguageForm = ->
  clearNotifications()
  name = $("#nameVal").val()
  code = $("#codeVal").val()
  if name.length is 0
    addErrorNotification("Falta o nome do Idioma!")
    return false
  else if code.length is 0
    addErrorNotification("Falta o código do Idioma!")
    return false
  else if code.length != 2
    addErrorNotification("O código do Idioma tem de ter 2 caracteres!")
    return false
  true


