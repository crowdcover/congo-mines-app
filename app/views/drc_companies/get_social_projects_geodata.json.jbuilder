presets = Array.new
baseUrl = request.protocol + request.host
unless request.port == (80 || 443) 
  baseUrl = baseUrl + ":" + request.port.to_s
end
json.type "FeatureCollection"

json.features @drc_company.social_projects do |social|
  json.type "Feature"
  json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [social.lng.to_f, social.lat.to_f]
    end
  end 
  json.properties do
    if social.drc_company.nil?
      json.drc_company social.drc_company
    else
      json.drc_company social.drc_company.name
      json.link baseUrl  + "/drc_companies/" + social.drc_company.to_param  
    end
    presets << {"tag" => 'drc_company', "label" => {"en" => 'Company Name', "fr" => 'Nom d’entreprise'}}

    json.company social.company
    presets << {"tag" => 'drc_company', "label" => {"en" => 'Company', "fr" => 'Entreprise'}}

    json.project_type social.project_type
    presets << {"tag" => 'project_type', "label" => {"en" => 'Project Type', "fr" => 'Type de projet'}}

    json.amount_planned social.amount_planned
    presets << {"tag" => 'amount_planned', "label" => {"en" => 'Amount Planned', "fr" => 'Montant prévu'}}

    json.amount_spent social.amount_spent
    presets << {"tag" => 'amount_spent', "label" => {"en" => 'Amount Spent', "fr" => 'Montant dépensé'}}

    json.stage social.stage
    presets << {"tag" => 'stage', "label" => {"en" => 'Stage', "fr" => 'Niveau de réalisation'}}

    json.description social.description
    presets << {"tag" => 'description', "label" => {"en" => 'Description', "fr" => 'Description'}}


    presets << {"tag" => 'link', "label" => {"en" => 'Link', "fr" => 'Lien'}}



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
