# frozen_string_literal: true

class Admin::EnvAndSocialObligationsController < Admin::Auth # ApplicationController
  active_scaffold :env_and_social_obligation do |config|
    config.label = 'Obligations environnementales et sociales (Relations communautaires)'

    config.columns = %i[community_fund enviro_impact_date enviro_impact_link
                        sustainable_dev_plan community_dialogue_platform social_investment source]

    config.columns.exclude(:created_at, :updated_at)

    config.columns[:community_fund].form_ui = :select
    config.columns[:community_fund].options = {
      include_blank: '',
      options: %w[oui non]
    }

    config.columns[:community_dialogue_platform].form_ui = :select
    config.columns[:community_dialogue_platform].options = {
      include_blank: '',
      options: %w[oui non]
    }
  end
end
