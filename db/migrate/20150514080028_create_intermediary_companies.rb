class CreateIntermediaryCompanies < ActiveRecord::Migration
  def change
    create_table :intermediary_companies do |t|
      t.string :name
      t.references :shareholder_relationship

      t.timestamps null: false
    end
  end
end
