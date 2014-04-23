# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#loginButton').click -> loginClick()



@loginClick = ->
  email = $('#emailVal').val()
  password = $('#passwordVal').val()

@validateLogin = (email, password) ->
  $.ajaxSetup async: false
  data = $.getJSON("/login.json",
    email: email
    password: password
  )
  $.ajaxSetup async: true
  data
