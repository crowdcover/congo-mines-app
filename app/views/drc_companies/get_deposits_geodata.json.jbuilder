# do jbuilder for geojson for map
json.type "FeatureCollection"
validDeposits = @drc_company.deposits.select { |deposit| deposit.lng != nil && deposit.lat != nil && deposit.lng != 0 && deposit.lat != 0 }
json.features validDeposits do |deposit|
  baseUrl = request.protocol + request.host
  unless request.port == (80 || 443) 
    baseUrl = baseUrl + ":" + request.port.to_s
  end
  json.type "Feature"
   json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [deposit.lng.to_f, deposit.lat.to_f]
    end
  end
  
  json.properties do
    
    json.link baseUrl  + "/drc_companies/" + deposit.drc_company.to_param
    json.name deposit.name
    json.drc_company deposit.drc_company.name
    json.mine_type deposit.mine_type
    json.permit_type deposit.permit_type
    json.permit_number deposit.permit_number
    
    json.proven_reserves(deposit.proven_reserves) do |res| 
      json.extract! res, :id, :created_at, :depoable_id, :depoable_type, :deposit_type, :grade, :tonnage, :measurement, :metal_content, :metal_content_unit, :updated_at, :mineral_resource
    end
    
    json.probable_reserves(deposit.probable_reserves) do |res| 
      json.extract! res, :id, :created_at, :depoable_id, :depoable_type, :deposit_type, :grade, :tonnage, :measurement, :metal_content, :metal_content_unit, :updated_at, :mineral_resource
    end

    json.total_reserves(deposit.total_reserves) do |res| 
      json.extract! res, :id, :created_at, :depoable_id, :depoable_type, :deposit_type, :grade, :tonnage, :measurement, :metal_content, :metal_content_unit, :updated_at, :mineral_resource
    end

    json.measured_resources(deposit.measured_resources) do |res| 
      json.extract! res, :id, :created_at, :depoable_id, :depoable_type, :deposit_type, :grade, :tonnage, :measurement, :metal_content, :metal_content_unit, :updated_at, :mineral_resource
    end

    json.indicated_resources(deposit.indicated_resources) do |res| 
      json.extract! res, :id, :created_at, :depoable_id, :depoable_type, :deposit_type, :grade, :tonnage, :measurement, :metal_content, :metal_content_unit, :updated_at, :mineral_resource
    end

    json.inferred_resources(deposit.inferred_resources) do |res| 
      json.extract! res, :id, :created_at, :depoable_id, :depoable_type, :deposit_type, :grade, :tonnage, :measurement, :metal_content, :metal_content_unit, :updated_at, :mineral_resource
    end

    json.total_resources(deposit.total_resources) do |res| 
      json.extract! res, :id, :created_at, :depoable_id, :depoable_type, :deposit_type, :grade, :tonnage, :measurement, :metal_content, :metal_content_unit, :updated_at, :mineral_resource
    end

    json.source deposit.source


    resourceList = Array.new

    deposit.proven_reserves.each do |res|
      resourceList << res.mineral_resource.name;
    end

    deposit.probable_reserves.each do |res|
      resourceList << res.mineral_resource.name;
    end

    deposit.total_reserves.each do |res|
      resourceList << res.mineral_resource.name;
    end

    deposit.measured_resources.each do |res|
      resourceList << res.mineral_resource.name;
    end

    deposit.indicated_resources.each do |res|
      resourceList << res.mineral_resource.name;
    end

    deposit.inferred_resources.each do |res|
      resourceList << res.mineral_resource.name;
    end

    deposit.total_resources.each do |res|
      resourceList << res.mineral_resource.name;
    end
   
    json.minerais resourceList.uniq.join(",")

    json.source deposit.source
  end


 
end
