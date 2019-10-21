# frozen_string_literal: true

module Admin::ShareholdersHelper
  def shareholder_name_column(record, _column)
    link_to(record.try(:name), record, target: '_blank', rel: 'noopener')
  end

  def shareholder_website_column(record, _column)
    link_to(record.try(:website), record.try(:website), target: '_blank', rel: 'noopener') if record.website.present?
  end
end
