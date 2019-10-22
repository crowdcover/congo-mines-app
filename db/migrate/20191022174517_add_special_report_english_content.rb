class AddSpecialReportEnglishContent < ActiveRecord::Migration
  def change
    add_column :special_reports, :tag, :string
    add_column :special_reports, :title_en, :string
    add_column :special_reports, :content_en, :text
  end
end
