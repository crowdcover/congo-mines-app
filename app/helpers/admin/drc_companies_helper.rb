# frozen_string_literal: true

# creates a popup link to page link
module Admin::DrcCompaniesHelper
  def drc_company_name_column(record, _column)
    link_to(record.try(:name), record, target: '_blank', rel: 'noopener')
  end

  def drc_company_website_column(record, _column)
    link_to(record.try(:website), record.try(:website), target: '_blank', rel: 'noopener') if record.website.present?
  end
end
