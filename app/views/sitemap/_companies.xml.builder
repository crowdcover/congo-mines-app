# frozen_string_literal: true

base_url = "http://#{request.host_with_port}"
@companies.each do |company|
  xml.url do
    xml.loc base_url + '/drc_companies/' + company.to_param
    xml.changefreq('weekly')
    xml.lastmod company.updated_at.strftime('%F')
    xml.priority(0.9)
  end
end
