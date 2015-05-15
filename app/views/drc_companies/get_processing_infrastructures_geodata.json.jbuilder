# do jbuilder for geojson for map/leaflet

json.type "FeatureCollection"

json.features @drc_company.processing_infrastructures do |p_infra|
  json.type "Feature"
  json.properties do
    json.name p_infra.name
    json.drc_company p_infra.drc_company.name
  end

  json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [deposit.lng, deposit.lat]
    end
  end
end
