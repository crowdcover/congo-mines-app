# frozen_string_literal: true

presets = []
base_url = request.protocol + request.host
base_url = base_url + ':' + request.port.to_s unless request.port == (80 || 443)

json.type 'FeatureCollection'

json.features @drc_company.processing_infrastructures do |p_infra|
  json.type 'Feature'
  json.geometry do
    json.type 'Point'
    json.coordinates do
      json.array! [p_infra.lng.to_f, p_infra.lat.to_f]
    end
  end
  json.properties do
    json.name p_infra.name
    presets << { 'tag' => 'name', 'label' => { 'en' => 'Name', 'fr' => 'Nom' } }

    json.drc_company p_infra.drc_company.name
    presets << { 'tag' => 'drc_company', 'label' => { 'en' => 'Company Name', 'fr' => 'Nom d’entreprise' } }

    json.link base_url + '/drc_companies/' + p_infra.drc_company.to_param
    presets << { 'tag' => 'link', 'label' => { 'en' => 'Link', 'fr' => 'Lien' } }

    json.source p_infra.source ? p_infra.source.name : ''

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
