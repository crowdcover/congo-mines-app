class CreateDepositResources < ActiveRecord::Migration
  def change
    create_table :deposit_resources do |t|
      t.references :deposit, index: true, foreign_key: true
      t.string :measurement
      t.string :resource
      t.integer :tonnage
      t.float :grade
      t.integer :metal_content
      t.string :metal_content_unit

      t.timestamps null: false
    end
  end
end
