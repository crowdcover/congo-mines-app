class CreateCongoleseCompanies < ActiveRecord::Migration
  def change
    create_table :congolese_companies do |t|
      t.string :name
      t.string :acronym
      t.string :nrc
      t.string :rccm
      t.string :contact
      t.string :website
      t.string :legal_status
      t.string :project_type
      t.string :project_phase
      t.string :legal_regime
      t.string :production_year
      t.string :type_of_product
      t.string :tonnage
      t.string :grade_percent
      t.string :metal_content
      t.string :export_value

      t.timestamps
    end
  end
end
