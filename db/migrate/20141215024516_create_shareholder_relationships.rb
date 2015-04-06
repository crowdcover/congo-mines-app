class CreateShareholderRelationships < ActiveRecord::Migration
  def change
    create_table :shareholder_relationships do |t|
      t.references :multinational_company, index: true
      t.references :congolese_company, index: true
      t.references :shareholder, index: true

      t.timestamps
    end
  end
end
