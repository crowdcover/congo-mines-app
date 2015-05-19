class Admin::EmployeesController < Admin::Auth #ApplicationController
  active_scaffold :"employee" do |config|
  
      config.columns[:year].form_ui = :select
      config.columns[:year].options = {include_blank: 'Select Year', options: (2000..Time.now.year) }
  end
end
