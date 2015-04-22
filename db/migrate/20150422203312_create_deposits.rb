class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.string :name
      t.references :drc_company, index: true, foreign_key: true
      t.string :mine_type
      t.string :permit_type
      t.string :permit_number
      t.string :proven_reserves
      t.string :probable_reserves
      t.string :proven_probable_reserves
      t.string :measured_resources
      t.string :indicated_resources
      t.string :inferred_resources
      t.string :source
      t.decimal  "lat", precision: 15, scale: 10
      t.decimal  "lng", precision: 15, scale: 10

      t.timestamps null: false
    end
  end
end
