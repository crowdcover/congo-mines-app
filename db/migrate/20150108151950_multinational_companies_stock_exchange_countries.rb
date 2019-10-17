class MultinationalCompaniesStockExchangeCountries < ActiveRecord::Migration
  def change
    
    create_table :multinational_companies_stock_exchange_countries, :id => false do |t|
      t.integer :multinational_company_id
      t.integer :stock_exchange_country_id  
    end 
    
    create_table :multinational_companies_stock_exchanges, :id => false do |t|
      t.integer :multinational_company_id
      t.integer :stock_exchange_id  
    end        
  
  end
end
