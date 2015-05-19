json.type "FeatureCollection"

json.features @social_projects do |social|
  json.type "Feature"
  json.properties do
    #social.drc_company.nil? ? json.drc_company "none" : json.drc_company social.drc_company.name #unless social.drc_company.nil?
    if social.drc_company.nil?
      json.drc_company social.drc_company
    else
      json.drc_company social.drc_company.name
    end
    json.company social.company
    json.project_type social.project_type
    json.amount_planned social.amount_planned
    json.amount_spent social.amount_spent
    json.stage social.stage
    json.description social.description
  end

  json.geometry do
    json.type "Point"
    json.coordinates do
      json.array! [social.lng, social.lat]
    end
  end
end
