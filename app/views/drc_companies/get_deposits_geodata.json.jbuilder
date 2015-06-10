# do jbuilder for geojson for map/leaflet

json.type "FeatureCollection"

json.features @drc_company.deposits do |deposit|
  json.type "Feature"
  json.properties do
    json.name deposit.name
    json.drc_company deposit.drc_company.name
    json.mine_type deposit.mine_type
    json.permit_type deposit.permit_type
    json.permit_number deposit.permit_number

    json.deposit_source deposit.deposit_source

    json.depoable do |depo|
      json.depoable_type depo.depoable_type
      json.deposit_type depo.deposit_type
      json.measurement depo.measurement
      json.grade depo.grade
      json.metal_content depo.metal_content
      json.metal_content_unit depo.metal_content_unit
      json.tonnage depo.tonnage
    end

  end

  json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [deposit.lng, deposit.lat]
    end
  end
end
