# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

success = (position) ->
    map = new OpenLayers.Map("basicMap")
    mapnik = new OpenLayers.Layer.OSM()
    fromProjection = new OpenLayers.Projection("EPSG:4326")
    toProjection = new OpenLayers.Projection("EPSG:900913")
    position = new OpenLayers.LonLat(position.coords.longitude, position.coords.latitude).transform(fromProjection, toProjection)
    zoom = 13
    map.addLayer mapnik
    map.setCenter position, zoom

error = (msg) ->
  console.log msg

initGeo = ->
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition(success, error)
  else
    error 'not supported'
  

$(initGeo)
  
