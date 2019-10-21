# frozen_string_literal: true

base_url = request.protocol + request.host
base_url = base_url + ':' + request.port.to_s unless request.port == (80 || 443)
json.type 'FeatureCollection'

json.features @processing_infrastructures do |p_infra|
  json.type 'Feature'
  json.geometry do
    json.type 'Point'
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
      json.link base_url + '/drc_companies/' + p_infra.drc_company.to_param
    end
  end
end
