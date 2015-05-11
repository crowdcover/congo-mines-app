# do jbuilder for geojson for map/leaflet

json.type "FeatureCollection"

json.features @drc_company.deposits do |deposit|
  json.type "Feature"
  json.properties do
    json.name deposit.name
    json.drc_company_id deposit.drc_company_id
    json.mine_type deposit.mine_type
    json.permit_type deposit.permit_type

    json.proven_reserves deposit.proven_reserves

    json.measured_resources deposit.measured_resources
  end

  json.geometry do
    json.type "Point"
    # json.coordinates json.array! deposit.lat, deposit.lng
    # json.coordinates deposit.lat, deposit.lng
  end
end
