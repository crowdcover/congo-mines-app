# frozen_string_literal: true

base_url = "http://#{request.host_with_port}"
@shareholders.each do |shareholder|
  xml.url do
    xml.loc base_url + shareholder_path(shareholder)
    xml.changefreq('weekly')
    xml.lastmod shareholder.updated_at.strftime('%F')
    xml.priority(0.8)
  end
end
