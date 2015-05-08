module ReportsHelper


  # creates a popup link to page link
  def title_column(record, column)
    link_to(h(record.title), report_url(record), target: "_blank")
  end
end
