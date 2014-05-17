# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $.ajaxSetup async: false
  $(".timeline").width(0)
  loadDates()
  loadEvents()


@loadDates = ->
  dates = getDates().sort()
  for date in dates
    addDate(date)

@loadEvents = ->
  events = getEvents()
  for event in events
    date = event["event"]["date"]
    eventID = event["event"]["id"]
    images = event["images"]
    timelineWidthAdd(40)
    for image in images
      path = image["path"].replace "public/" , ""
      imageID = image["id"]
      addImage(date, path, eventID, imageID)


@getDates = ->
  $.getJSON("/getDates.json")["responseJSON"]

@getEvents = ->
  $.getJSON("/events.json")["responseJSON"]

@addDate = (date) ->
  html  = "<div id='#{date}' class='year'>"
  html += "<div class='navigation'> #{date}</div>"
  html += "  <div class='images'></div>"
  html += "</div>"
  $(".timeline").append(html)

@addImage = (date, path, eventID, imageID) ->
  html = "<img src='#{path}' eventID='#{eventID} id='#{imageID}'>"
  $("\##{date} .images").append(html)
  oldWidth = $(".timeline").width()
  timelineWidthAdd(270)
  console.log(oldWidth)

@timelineWidthAdd = (width) ->
  oldWidth = $(".timeline").width()
  $(".timeline").width(oldWidth + width)