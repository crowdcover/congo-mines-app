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
    json.key_format! camelize: :upper
    json.link baseUrl  + "/drc_companies/" + deposit.drc_company.to_param
    json.nom deposit.name
    json.nom_compagnie deposit.drc_company.name
    json.id_compagnie deposit.drc_company.to_param
    json.type deposit.mine_type
    json.permis_type deposit.permit_type
    json.permis_number deposit.permit_number
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
