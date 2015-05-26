class Admin::ShareholdersController  < Admin::Auth # ApplicationController
  active_scaffold :"shareholder" do |config|
  
    config.label = 'Shareholder (en dernier ressort)'

    config.columns.exclude(:stock, :drc_companies, :created_at, :updated_at)
    config.list.per_page    = 25 

    #config.columns[:drc_companies].options = {:draggable_lists => true}
    #config.columns[:drc_companies].form_ui = :chosen
    # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
    
    config.columns[:stock].form_ui = :select
    config.columns[:stock].options = {
      include_blank: '', 
      options: ['yes', 'no']} 
   
   
   config.columns[:public_private].form_ui = :select
    config.columns[:public_private].options = {
      include_blank: 'Select option', 
      options: ['state', 'state owned enterprise', 'private']} 
   
   
    
  end
end
