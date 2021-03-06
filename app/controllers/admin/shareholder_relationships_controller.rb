# frozen_string_literal: true

class Admin::ShareholderRelationshipsController < Admin::Auth # ApplicationController
  active_scaffold :shareholder_relationship do |config|
    # config.label = 'Shareholder (en dernier ressort)'
    config.columns.exclude(:created_at, :updated_at)
    config.columns = %i[percentage year year_end drc_company shareholder intermediary_companies source]

    # config.columns[:shareholder].label = 'Shareholder (en dernier ressort)'

    config.columns[:drc_company].form_ui = :chosen
    config.columns[:shareholder].form_ui = :chosen
    config.columns[:intermediary_companies].form_ui = :chosen

    config.columns[:year].form_ui = :select
    config.columns[:year].options = { include_blank: 'Sélectionnez l\'année', options: (2000..Time.zone.now.year) }

    config.columns[:year_end].form_ui = :select
    config.columns[:year_end].options = { include_blank: 'Sélectionnez l\'année', options: (2000..Time.zone.now.year) }

    # Export
    config.actions.add :export
    config.export.force_quotes = 'true'
    config.export.force_quotes = 'true'
  end
end
