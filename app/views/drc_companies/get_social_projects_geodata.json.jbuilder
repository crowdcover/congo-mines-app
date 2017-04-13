
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
    json.key_format! camelize: :upper
    if social.drc_company.nil?
      json.nom_compagnie social.drc_company
    else
      json.nom_compagnie social.drc_company.name
    end
    json.compagnie social.company
    json.type_projet social.project_type
    json.montant_prévu social.amount_planned
    json.montant_dépensé social.amount_spent
    json.étape social.stage
    json.description social.description
  end

  
end
