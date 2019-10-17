class CreateDrcCompanies < ActiveRecord::Migration
  def change
    create_table :drc_companies do |t|
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

      t.timestamps
    end
  end
end
