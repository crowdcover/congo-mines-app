# do jbuilder for geojson for map/leaflet

json.type "FeatureCollection"

json.features @drc_companies do |company|
  json.type "Feature"
  json.properties company.deposits do |deposit|
    json.name deposit.name
    json.company deposit.company
    json.type deposit.type
    json.permit_type deposit.permit_type
    json.permit_name deposit.permit_name
  end
  json.geometry company.deposits do |deposit|
    json.type "Point"
    json.coordinates deposit.lon deposit.lat
  end
end
