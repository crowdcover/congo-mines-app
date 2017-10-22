class AddSpecialReports < ActiveRecord::Migration
  def change
    create_table :special_reports do |t|
      t.string :title
      t.text :content
    end
  end
end
