class Admin::DepositsController <  Admin::Auth
  active_scaffold :"deposit" do |config|
      # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
    
    config.columns.exclude(:created_at, :updated_at)
       
    config.columns[:permit_type].form_ui = :select
    config.columns[:permit_type].options = {
      include_blank: 'Select Permit Type', 
      options: [  'Permis de Recherche',
        'Permis d’Exploitation',
        'Permis d’exploitation des Rejets',
        'Permis d’Exploitation de Petit Mine']}
  end
end
