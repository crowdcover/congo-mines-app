# do jbuilder for geojson for map

json.type "FeatureCollection"
validDeposits = @drc_company.deposits.select { |deposit| deposit.lng != nil && deposit.lat != nil && deposit.lng != 0 && deposit.lat != 0 }

json.features validDeposits do |deposit|
  json.type "Feature"
  json.properties do
    json.name deposit.name
    json.drc_company deposit.drc_company.name
    json.mine_type deposit.mine_type
    json.permit_type deposit.permit_type

    json.proven_reserves deposit.proven_reserves

    json.measured_resources deposit.measured_resources
  end

  json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [deposit.lng.to_f, deposit.lat.to_f]
    end
  end
end
