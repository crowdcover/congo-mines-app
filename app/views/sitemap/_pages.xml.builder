# frozen_string_literal: true

base_url = "http://#{request.host_with_port}"
@pages.each do |page|
  xml.url do
    xml.loc base_url + page_path(page)
    xml.changefreq('weekly')
    xml.lastmod page.updated_at.strftime('%F')
    xml.priority(0.8)
  end
end
