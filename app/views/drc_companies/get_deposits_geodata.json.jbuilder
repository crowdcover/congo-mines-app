# do jbuilder for geojson for map/leaflet

json.type "FeatureCollection"
validDeposits = @drc_company.deposits.select { |deposit| deposit.lng != nil && deposit.lat != nil && deposit.lng != 0 && deposit.lat != 0 }
json.features validDeposits do |deposit|
  json.type "Feature"
  json.properties do
    json.name deposit.name
    json.drc_company deposit.drc_company.name
    json.mine_type deposit.mine_type
    json.permit_type deposit.permit_type
    json.permit_number deposit.permit_number
    json.proven_reserves deposit.proven_reserves
    json.probable_reserves deposit.probable_reserves
    json.proven_probable_reserves deposit.total_reserves
    json.measured_resources deposit.measured_resources
    json.indicated_resources deposit.indicated_resources
    json.inferred_resources deposit.inferred_resources
    json.source deposit.source
  end


  json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [deposit.lng, deposit.lat]
    end
  end
end
