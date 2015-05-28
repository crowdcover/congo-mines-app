class Admin::EmployeesController < Admin::Auth #ApplicationController
  active_scaffold :"employee" do |config|
  
      config.columns[:year].form_ui = :select
      config.columns[:year].options = {
        include_blank: 'Select Year', 
        options: (2000..Time.now.year) }
      
      config.columns[:nationality].form_ui = :select
      config.columns[:nationality].options = {
        include_blank: 'Select Nationality', 
        options: ['congolese','expatriot'] }
      
      config.columns[:contract_type].form_ui = :select
      config.columns[:contract_type].options = {
        include_blank: 'Select Contract Type', 
        options: ['direct', 'indirect'] }

      config.columns[:gender].form_ui = :select
      config.columns[:gender].options = {
        include_blank: 'Select Gender', 
        options: ['male','female'] }

      
  end
end
