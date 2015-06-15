# creates a popup link to page link
module Admin::DrcCompaniesHelper

  def drc_company_name_column(record, column)
    link_to(record.try(:name), record, target: "_blank")
  end

  def drc_company_website_column(record, column)
    link_to(record.try(:website), record.try(:website), target: "_blank") if record.website.present?
  end

end
