# frozen_string_literal: true

class Admin::ShareholdersController < Admin::Auth
  active_scaffold :shareholder do |config|
    config.label = 'Actionnaire (en dernier ressort)'

    config.columns.exclude(:stock, :stock_countries, :shareholder_relationships,
                           :drc_companies, :created_at, :updated_at)
    config.list.per_page = 25

    # config.columns[:drc_companies].options = {:draggable_lists => true}
    # config.columns[:drc_companies].form_ui = :chosen
    # Export
    config.actions.add :export
    config.export.force_quotes = 'true'
    config.export.force_quotes = 'true'

    config.columns[:stock].form_ui = :select
    config.columns[:stock].options = {
      include_blank: '',
      options: %w[oui non]
    }

    # config.columns[:shareholder_relationships].allow_add_existing = false

    config.columns[:public_private].form_ui = :select
    config.columns[:public_private].options = {
      include_blank: 'Sélectionnez Option',
      options: ['état', 'entreprise d\'État', 'privé']
    }
  end
end
