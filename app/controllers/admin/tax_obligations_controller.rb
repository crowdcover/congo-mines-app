# frozen_string_literal: true

class Admin::TaxObligationsController < Admin::Auth
  active_scaffold :tax_obligation do |config|
    config.label = 'Paiements d\'impôt'
    config.columns[:year].form_ui = :select
    config.columns[:year].options = { include_blank: 'Sélectionnez l\'année', options: (2000..Time.zone.now.year) }
    config.columns.exclude(:company_name)
  end
end
