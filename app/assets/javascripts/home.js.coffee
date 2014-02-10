$ ->
  mapOptions =
    center: new google.maps.LatLng(-34.397, 150.644)
    zoom: 8
    mapTypeId: google.maps.MapTypeId.SATELLITE
  map = new google.maps.Map($("#map_canvas")[0], mapOptions)
  # slc_pos = new google.maps.LatLng(40.743668, -111.885232)
  # vicksburg_pos = new google.maps.LatLng(32.394939, -90.782712)
  # slc = new google.maps.Marker(
  #   position: slc_pos
  #   map: map
  # )
  # vicksburg = new google.maps.Marker(
  #   position: vicksburg_pos,
  #   map: map
  # )

  # setBounds = ->
  #   map_bounds = new google.maps.LatLngBounds(null)
  #   for location in locations
  #     map_bounds.extend location.getPosition()
  #   map.fitBounds map_bounds
  #   map.panToBounds map_bounds
  #   map.setZoom map.getZoom() - 1
