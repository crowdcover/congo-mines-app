class Admin::MultinationalCompaniesController < ApplicationController
  active_scaffold :"multinational_company" do |config|
    config.label = 'Multinational Companies'    
    config.columns.exclude(:shareholder_relationships, :congolese_companies,
       :created_at, :updated_at, :multinationalcompanies_stock_exchanges,
        :multinationalcompanies_stock_exchange_countries)
       
       # :stock_exchange_countries, :stock_exchanges,
       
     config.list.columns.exclude(:stock_exchange_countries)
     #config.update.columns.exclude(:shareholders, :shareholder_relationships)
      
       config.columns[:stock_exchange_countries].form_ui = :select
       config.columns[:stock_exchanges].form_ui = :select
  end
end
