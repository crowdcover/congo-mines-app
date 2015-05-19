class Admin::ShareholdersController  < Admin::Auth # ApplicationController
  active_scaffold :"shareholder" do |config|
  
    config.label = 'Shareholder (en dernier ressort)'

    config.columns.exclude(:stock, :drc_companies, :created_at, :updated_at)

    #config.columns[:drc_companies].options = {:draggable_lists => true}
    #config.columns[:drc_companies].form_ui = :chosen
    # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
  end
end
