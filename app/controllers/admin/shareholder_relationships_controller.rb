class Admin::ShareholderRelationshipsController  < Admin::Auth # ApplicationController
  active_scaffold :"shareholder_relationship" do |config|
    
    config.columns.exclude(:drc_companies, :created_at, :updated_at)
    config.columns = [:percentage, :year, :drc_company, :shareholder ]
    
    config.columns[:drc_company].form_ui = :chosen    
    config.columns[:shareholder].form_ui = :chosen
  
  end
end
