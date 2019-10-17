class CreateTaxObligations < ActiveRecord::Migration
  def change
    create_table :tax_obligations do |t|
      t.references :drc_company, index: true
      t.integer :year
      t.string :company_name
      t.integer :total_paid
      t.integer :redevance 
      t.integer :ibp
      t.boolean :import_customs_duty
      t.integer :surface_rights
      t.integer :signature_bonus
      t.integer :royalties
      t.integer :other
      t.timestamps
    end
  end
end
