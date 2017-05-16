# do jbuilder for geojson for map
presets = Array.new

baseUrl = request.protocol + request.host
unless request.port == (80 || 443) 
  baseUrl = baseUrl + ":" + request.port.to_s
end

json.type "FeatureCollection"
validDeposits = @drc_company.deposits.select { |deposit| deposit.lng != nil && deposit.lat != nil && deposit.lng != 0 && deposit.lat != 0 }
json.features validDeposits do |deposit|

  json.type "Feature"
   json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [deposit.lng.to_f, deposit.lat.to_f]
    end
  end
  
  json.properties do
    
    json.name deposit.name
    presets << {"tag" => 'name', "label" => {"en" => 'Name', "fr" => 'Nom'}}

    json.drc_company deposit.drc_company.name
    presets << {"tag" => 'drc_company', "label" => {"en" => 'Company Name', "fr" => 'Nom d’entreprise'}}

    json.mine_type deposit.mine_type
    presets << {"tag" => 'mine_type', "label" => {"en" => 'Type', "fr" => 'Type'}}

    json.permit_type deposit.permit_type
    presets << {"tag" => 'permit_type', "label" => {"en" => 'Permit Type', "fr" => 'Type de Permis'}}

    json.permit_number deposit.permit_number
    presets << {"tag" => 'permit_number', "label" => {"en" => 'Permit Number', "fr" => 'Numéro de Permis'}}

    json.link baseUrl  + "/drc_companies/" + deposit.drc_company.to_param
    presets << {"tag" => 'link', "label" => {"en" => 'Link', "fr" => 'Lien'}}
    
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

    json.maphubs_metadata do
      json.presets presets do |preset|
        json.tag preset['tag']
        json.label do 
          json.en preset['label']['en']
          json.fr preset['label']['fr']
        end
      end
    end


  end


 
end
