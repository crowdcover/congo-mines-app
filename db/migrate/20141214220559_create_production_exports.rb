class CreateProductionExports < ActiveRecord::Migration
  def change
    create_table :production_exports do |t|
      t.references :drc_company, index: true
      t.integer :year
      t.string :type_of_product
      t.string :tonnage
      t.integer :grade
      t.string :metal_content
      t.decimal :export_value

      t.timestamps
    end
  end
end
