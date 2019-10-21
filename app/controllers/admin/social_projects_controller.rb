# frozen_string_literal: true

class Admin::SocialProjectsController < Admin::Auth
  active_scaffold :social_project do |config|
    config.columns = %i[drc_company project_type year amount_planned
                        amount_spent stage description lat lng]

    config.columns[:year].form_ui = :select
    config.columns[:year].options = {
      include_blank: 'Sélectionnez l\'année',
      options: (2000..Time.zone.now.year)
    }

    # Export
    config.actions.add :export
    config.export.force_quotes = 'true'
    config.export.force_quotes = 'true'
  end
end
