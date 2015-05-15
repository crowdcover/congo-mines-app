class Admin::ShareholderRelationshipsController  < Admin::Auth # ApplicationController
  active_scaffold :"shareholder_relationship" do |config|
    
    config.columns.exclude(:drc_companies, :created_at, :updated_at)
    config.columns = [:percentage, :year, :drc_company, :shareholder, :intermediary_companies ]
    
    config.columns[:drc_company].form_ui = :chosen    
    config.columns[:shareholder].form_ui = :chosen
    config.columns[:intermediary_companies].form_ui = :chosen
    
      # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
  end
end
