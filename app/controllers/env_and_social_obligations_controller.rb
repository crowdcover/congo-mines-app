class EnvAndSocialObligationsController < ApplicationController

  active_scaffold :"env_and_social_obligation" do |config|
    config.label = 'Environmental and Social Obligations'
    config.columns[:year].form_ui = :select
    config.columns[:year].options = {include_blank: 'Select Year', options: (1950..2014) }
    
    config.columns.exclude(:created_at, :updated_at)
  end
  
  
end
