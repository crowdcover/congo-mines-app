class CreateShareholderRelationships < ActiveRecord::Migration
  def change
    create_table :shareholder_relationships do |t|
      t.references :drc_company, index: true
      t.references :shareholder, index: true
      t.integer :percentage
      t.integer :year

      t.timestamps
    end
  end
end
