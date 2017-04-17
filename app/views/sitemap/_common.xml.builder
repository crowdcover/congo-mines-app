base_url = "http://#{request.host_with_port}/"

@staticpages.each do |page|
  xml.url do
    xml.loc base_url+page
    xml.changefreq("daily")
    xml.priority(1.0)
  end

end