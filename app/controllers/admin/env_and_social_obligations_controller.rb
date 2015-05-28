class Admin::EnvAndSocialObligationsController  < Admin::Auth #ApplicationController

  active_scaffold :"env_and_social_obligation" do |config|
    config.label = 'Environmental and Social Obligations (community relations)'
    
    config.columns =[:community_fund, :enviro_impact_date, :enviro_impact_link,
     :sustainable_dev_plan, :community_dialogue_platform, :social_investment]

    config.columns.exclude(:created_at, :updated_at)

    config.columns[:community_fund].form_ui = :select
    config.columns[:community_fund].options = {
      include_blank: '', 
      options: ['yes', 'no']}   
  
    config.columns[:community_dialogue_platform].form_ui = :select
    config.columns[:community_dialogue_platform].options = {
      include_blank: '', 
      options: ['yes', 'no']}      

  end
  
end
