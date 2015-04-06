class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.string :organization
      t.text :summary
      t.date :post_date
      t.string :date_string 
      t.string :cm_url
      t.references :author, index: true
      t.references :source, index: true

      t.timestamps
    end
  end
end
