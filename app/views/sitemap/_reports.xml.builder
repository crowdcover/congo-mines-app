base_url = "http://#{request.host_with_port}"
@reports.each do |report|
  xml.url do
    xml.loc base_url+report_path(report)
    xml.changefreq("weekly")
    xml.lastmod report.updated_at.strftime("%F")
    xml.priority(0.9)
  end

end