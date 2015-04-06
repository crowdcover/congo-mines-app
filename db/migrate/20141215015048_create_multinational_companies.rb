class CreateMultinationalCompanies < ActiveRecord::Migration
  def change
    create_table :multinational_companies do |t|
      t.string :name
      t.string :acronym
      t.string :contact
      t.string :website
      t.string :listed
      t.string :on
      t.string :stock
      t.boolean :market
      t.string :stock_information
      t.string :stock_symbol

      t.timestamps
    end
  end
end
