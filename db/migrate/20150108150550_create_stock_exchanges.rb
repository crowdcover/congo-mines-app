class CreateStockExchanges < ActiveRecord::Migration
  def change
    create_table :stock_exchanges do |t|
      t.string :name

      t.timestamps
    end
  end
end
