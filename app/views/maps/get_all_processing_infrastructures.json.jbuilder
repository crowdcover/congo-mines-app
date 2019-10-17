baseUrl = request.protocol + request.host
unless request.port == (80 || 443) 
  baseUrl = baseUrl + ":" + request.port.to_s
end
json.type "FeatureCollection"

json.features @processing_infrastructures do |p_infra|
  json.type "Feature"
  json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [p_infra.lng.to_f, p_infra.lat.to_f]
    end
  end

  
  json.properties do
    json.name p_infra.name
    if p_infra.drc_company.nil?
      json.drc_company p_infra.drc_company
    else
      json.drc_company p_infra.drc_company.name
      json.link baseUrl  + "/drc_companies/" + p_infra.drc_company.to_param
    end
  end
end
