# frozen_string_literal: true

base_url = "http://#{request.host_with_port}"
@attachments.each do |attachment|
  xml.url do
    xml.loc base_url + attachment.asset.url
    xml.changefreq('monthly')
    xml.lastmod attachment.updated_at.strftime('%F')
    xml.priority(0.7)
  end
end
