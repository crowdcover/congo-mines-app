class CreateStockExchangeCountries < ActiveRecord::Migration
  def change
    create_table :stock_exchange_countries do |t|
      t.string :name

      t.timestamps
    end
  end
end
