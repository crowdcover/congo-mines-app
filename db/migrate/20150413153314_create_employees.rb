class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :drc_company, index: true, foreign_key: true
      t.integer :year
      t.integer :direct_expat
      t.integer :direct_congolese
      t.integer :subcontractor_expat
      t.integer :subcontractor_congolese

      t.timestamps null: false
    end
  end
end
