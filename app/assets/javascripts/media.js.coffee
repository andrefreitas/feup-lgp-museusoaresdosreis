# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $.ajaxSetup async: false
  $(".timeline").width(0)
  loadDates()
  loadEvents()
  bindImagesClick()
  bindTextEventsClick()
  $(".close").click -> hideModal("#modal")
  $(".close").click -> hideModal("#modal-noimage")
  $("#modal img.picture").click -> hideModal("#modal")
  $("#autoPlay").click -> autoPlay()


@loadDates = ->
  dates = getDates().sort()
  for date in dates
    timelineWidthAdd(40)
    addDate(date)

@loadEvents = ->
  events = getEvents()
  for event in events
    date = event["event"]["date"]
    eventID = event["event"]["id"]
    title = event["event"]["title"]
    content = event["event"]["content"]
    images = event["images"]
    if images.length > 0
      for image in images
        path = image["path"].replace "public/" , ""
        imageID = image["id"]
        title = image["title"]
        if(!title)
          title=""
        else
          title = title.substr(0,37) + if title.length > 37 then "..." else ""
        addImage(date, path, eventID, imageID, title)
    else
      addEvent(date, eventID, title, content)

@addEvent = (date, eventID, title)->
  html = "<div class='event-text' eventID='#{eventID}' id='ev-#{eventID}' ><div class='event-inside' id='ev-in-#{eventID}'>#{title}</div> </div>"
  $("\##{date} .images").append(html)
  sel = "#ev-" + eventID
  imageWidth = $(sel).width()
  timelineWidthAdd(imageWidth  + 60)
  sel2 = "#ev-in-" + eventID
  $(sel2).css( "paddingTop", ( 400 - $(sel2).height() ) / 2 );

@bindTextEventsClick = ->
  $(".event-text").click -> eventClick(this)

@eventClick = (elem) ->
  eventID = $(elem).attr("eventID")
  event = getEvent(eventID)
  title = event['title']
  content = event['content']
  console.log(event)
  $("#modal-noimage .mod-title").html(title)
  $("#modal-noimage .description").html(content)
  showModal("#modal-noimage")


@getDates = ->
  $.getJSON("/getDates.json")["responseJSON"]

@getEvents = ->
  $.getJSON("/getEvents.json")["responseJSON"]

@getImage = (id) ->
  $.getJSON("/getImage.json", id: id)["responseJSON"]

@getEvent = (id) ->
  $.getJSON("/getEvent.json", id: id)["responseJSON"]

@addDate = (date) ->
  html  = "<div id='#{date}' class='year'>"
  html += "<div class='navigation'> #{date}</div>"
  html += "  <div class='images'></div>"
  html += "</div>"
  $(".timeline").append(html)

@addImage = (date, path, eventID, imageID, title) ->
  html = "<div class=\"image\"><div class=\"title\"> #{title}</div><img src='#{path}' eventID='#{eventID}' imageID='#{imageID}' id='img-#{imageID}'></div>"
  $("\##{date} .images").append(html)

  sel = "#img-" + imageID
  $(sel).load -> onImageLoad(this)


@onImageLoad = (elem) ->
  imageWidth = $(elem).width()
  timelineWidthAdd(imageWidth  + 20)

@timelineWidthAdd = (width) ->
  oldWidth = $(".timeline").width()
  $(".timeline").width(oldWidth + width)

@bindImagesClick = ->
  $(".images img").click -> imageClick(this)

@imageClick = (elem) ->
  imageID = $(elem).attr("imageID")
  image = getImage(imageID)
  description = image["caption"]
  path = image["path"].replace "public/" , ""
  console.log(image)
  $("#modal .description").html(description)
  $("#modal img.picture").attr("src", path)
  $("#modal img.picture").attr("data-big", path)
  options =
    height: 150
    width: 150
    scale: 1.5
  $("#modal img.picture").image_zoomer options

  showModal("#modal")

@showModal = (elem) ->
  $("html").append("<div class='block'></div>")
  $(elem).fadeIn()

@hideModal = (elem) ->
  $(elem).fadeOut()
  $(".block").remove()

@changeLang = (elem) ->
  $.ajaxSetup async: false
  data = $.getJSON("/changeLang.json",
    code: elem
  )
  $.ajaxSetup async: true
  $.parseJSON(data["responseText"])["result"] is "ok"
  location.reload(true)


pieces = new Array()
counter = 0;
@autoPlay = () ->

  events = getEvents()
  for event in events
    images = event["images"]
    if images.length > 0
      for image in images
        piec = new Array()
        imageID = image["id"]
        piec['id'] = imageID
        piec['type'] = '2'
        pieces.push piec
    else
      piec = new Array()
      piec['id'] = event["event"]["id"] 
      piec['type'] = '1'
      pieces.push piec

  alert("1 " + pieces[1]['type'])
  counter = 0;
  nextEvent()

@nextEvent = () ->
  if counter >= pieces.length
    return

  
  if pieces[counter]['type'] is '1'
    event = getEvent(pieces[counter]['id'])
    title = event['title']
    content = event['content']
    console.log(event)
    $("#modal-noimage .mod-title").html(title)
    $("#modal-noimage .description").html(content)
    showModal("#modal-noimage")
  else
    image = getImage(pieces[counter]['id'])
    description = image["caption"]
    path = image["path"].replace "public/" , ""
    console.log(pieces[counter]['id'])
    $("#modal .description").html(description)
    $("#modal img.picture").attr("src", path)
    $("#modal img.picture").attr("data-big", path)
    options =
      height: 150
      width: 150
      scale: 1.5
    $("#modal img.picture").image_zoomer options
    showModal("#modal")

  counter = counter + 1
  setTimeout("closeModals()", 2000)

@closeModals = () ->
  hideModal("#modal")
  hideModal("#modal-noimage")
  setTimeout("nextEvent()",1000)