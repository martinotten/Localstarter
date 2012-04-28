# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

success = (position) ->
  console.log position

error = (msg) ->
  console.log msg

if navigator.geolocation
  navigator.geolocation.getCurrentPosition(success, error)
else
  error 'not supported'