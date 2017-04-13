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
    json.key_format! camelize: :upper
    json.nom p_infra.name
    if p_infra.drc_company.nil?
      json.nom_compagnie p_infra.drc_company
    else
      json.nom_compagnie p_infra.drc_company.name
    end
  end
end
