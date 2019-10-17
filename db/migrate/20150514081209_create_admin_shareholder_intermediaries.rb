class CreateAdminShareholderIntermediaries < ActiveRecord::Migration
  def change
    create_table :shareholder_intermediaries do |t|
      t.references :shareholder_relationship,  foreign_key: true #, index: true
      t.references :intermediary_company,  foreign_key: true #,index: true

      t.timestamps null: false
    end
  end
end
