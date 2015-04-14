class CreateReportRelations < ActiveRecord::Migration
  def change
    create_table :report_relations do |t|
      t.references :drc_company, index: true
      t.references :report, index: true
      #t.timestamps null: false
    end
  end
end
