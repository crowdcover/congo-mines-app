class CreateProcessingInfrastructures < ActiveRecord::Migration
  def change
    create_table :processing_infrastructures do |t|
      t.string :name
      t.references :drc_company, index: true, foreign_key: true
      t.decimal  "lat", precision: 15, scale: 10
      t.decimal  "lng", precision: 15, scale: 10

      t.timestamps null: false
    end
  end
end
