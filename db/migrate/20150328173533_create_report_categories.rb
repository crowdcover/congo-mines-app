class CreateReportCategories < ActiveRecord::Migration
  def change
    create_table :report_categories do |t|
      t.references :category, index: true, foreign_key: true
      t.references :report, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
