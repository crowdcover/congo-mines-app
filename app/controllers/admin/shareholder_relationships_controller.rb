class Admin::ShareholderRelationshipsController  < Admin::Auth # ApplicationController
  active_scaffold :"shareholder_relationship" do |config|
    
    
    #config.label = 'Shareholder (en dernier ressort)'
    config.columns.exclude(:drc_companies, :created_at, :updated_at)
    config.columns = [:percentage, :year, :drc_company, :shareholder, :intermediary_companies ]
    
    config.columns[:shareholder].label = 'Shareholder (en dernier ressort)'
    
    config.columns[:drc_company].form_ui = :chosen    
    config.columns[:shareholder].form_ui = :chosen
    config.columns[:intermediary_companies].form_ui = :chosen
    
    config.columns[:year].form_ui = :select
    config.columns[:year].options = {include_blank: 'Select Year', options: (2000..Time.now.year) }
    
      # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
  end
end
