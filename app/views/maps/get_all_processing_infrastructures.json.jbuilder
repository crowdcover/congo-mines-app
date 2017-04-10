json.type "FeatureCollection"

json.features @processing_infrastructures do |p_infra|
  json.type "Feature"
  json.properties do
    json.name p_infra.name
    if p_infra.drc_company.nil?
      json.drc_company p_infra.drc_company
    else
      json.drc_company p_infra.drc_company.name
    end
  end

  json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [p_infra.lng.to_f, p_infra.lat.to_f]
    end
  end
end
