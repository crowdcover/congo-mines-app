class Admin::EmployeesController < Admin::Auth #ApplicationController
  active_scaffold :"employee" do |config|
  
      config.columns[:year].form_ui = :select
      config.columns[:year].options = {
        include_blank: 'Année sélectionnée', 
        options: (2000..Time.now.year) }
      
      config.columns[:nationality].form_ui = :select
      config.columns[:nationality].options = {
        include_blank: 'Sélectionner la nationalité', 
        options: ['congolese','expatrié'] }
      
      config.columns[:contract_type].form_ui = :select
      config.columns[:contract_type].options = {
        include_blank: 'Sélectionnez Type de contrat', 
        options: ['direct', 'indirect'] }

      config.columns[:gender].form_ui = :select
      config.columns[:gender].options = {
        include_blank: 'Sélectionnez le sexe', 
        options: ['mâle','femelle'] }

      
  end
end
