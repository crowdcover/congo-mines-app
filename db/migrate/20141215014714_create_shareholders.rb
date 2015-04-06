class CreateShareholders < ActiveRecord::Migration
  def change
    create_table :shareholders do |t|
      t.string :drc_company
      t.string :partnership_with_the_portfolio_companies_of_the_state
      t.string :state
      t.string :private_direct
      t.string :private_indirect
      t.integer :year

      t.timestamps
    end
  end
end
