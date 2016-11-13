# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

display_number = ->
  document.getElementByName('course_number').disabled = false
  document.getElementById('test1').innerHTML = "Hello"
  return
