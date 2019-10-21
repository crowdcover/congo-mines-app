# frozen_string_literal: true

base_url = request.protocol + request.host
base_url = base_url + ':' + request.port.to_s unless request.port == (80 || 443)

json.type 'FeatureCollection'
valid_deposits = @deposits.select { |deposit| !deposit.lng.nil? && !deposit.lat.nil? && deposit.lng != 0 && deposit.lat != 0 }
json.features valid_deposits do |deposit|
  # deposit.probable_reserves.each {|res| res["MINERAL_NAME"] = res.to_label }

  json.type 'Feature'

  json.geometry do
    json.type 'Point'
    json.coordinates do
      json.array! [deposit.lng.to_f, deposit.lat.to_f]
    end
  end

  json.properties do
    json.name deposit.name
    json.company_name deposit.drc_company.name
    json.drc_company deposit.drc_company.to_param
    json.mine_type deposit.mine_type
    json.permit_type deposit.permit_type
    json.permit_number deposit.permit_number
    json.link base_url + '/drc_companies/' + deposit.drc_company.to_param

    resource_list = []

    deposit.proven_reserves.each do |res|
      resource_list << res.mineral_resource.name
    end

    deposit.probable_reserves.each do |res|
      resource_list << res.mineral_resource.name
    end

    deposit.total_reserves.each do |res|
      resource_list << res.mineral_resource.name
    end

    deposit.measured_resources.each do |res|
      resource_list << res.mineral_resource.name
    end

    deposit.indicated_resources.each do |res|
      resource_list << res.mineral_resource.name
    end

    deposit.inferred_resources.each do |res|
      resource_list << res.mineral_resource.name
    end

    deposit.total_resources.each do |res|
      resource_list << res.mineral_resource.name
    end

    json.minerals resource_list.uniq.join(',')

    json.source deposit.source
  end
end
