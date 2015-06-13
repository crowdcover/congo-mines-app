json.type "FeatureCollection"
validDeposits = @deposits.select { |deposit| deposit.lng != nil && deposit.lat != nil && deposit.lng != 0 && deposit.lat != 0 }
json.features validDeposits do |deposit|
  #deposit.probable_reserves.each {|res| res["MINERAL_NAME"] = res.to_label }

  json.type "Feature"
  json.properties do
    json.name deposit.name
    json.drc_company deposit.drc_company.name
    json.mine_type deposit.mine_type
    json.permit_type deposit.permit_type
    json.permit_number deposit.permit_number
    json.proven_reserves deposit.proven_reserves
    
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


    json.source deposit.source
  end


  json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [deposit.lng, deposit.lat]
    end
  end
end
