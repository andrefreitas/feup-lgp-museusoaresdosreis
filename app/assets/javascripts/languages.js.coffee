# Events binding
$(window).ready ->
  $('#addLanguageButton').click -> addLanguageClick()
  $('.lang .delete').click -> deleteLanguageClick(this)

# Events Handlers

addLanguageClick = ->
  name  = $("#newLang option:selected").text()
  code = $("#newLang  option:selected").val()
  console.log(name)
  console.log(code)
  result = addLanguage(name, code)
  console.log(result)
  window.location.replace("languages?notice=new")


deleteLanguageClick = (elem) ->
  langDiv = $(elem).parent().parent()
  langID = $(langDiv).attr("id")
  langName = $(langDiv).children(".name").first().html()
  confirmation = confirm("Pretende mesmo eliminar " + langName + " ?")
  if confirmation is true
    $(langDiv).fadeOut()
    @deleteLanguage(langID)
    window.location.replace("languages?notice=deleted")

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


