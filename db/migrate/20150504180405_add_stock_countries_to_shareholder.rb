class AddStockCountriesToShareholder < ActiveRecord::Migration
  def change
    add_column :shareholders, :stock_countries, :string
    add_column :shareholders, :stock_exchange, :string
    add_column :shareholders, :stock_symbol, :string
  end
end
