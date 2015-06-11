class AddDraftToReports < ActiveRecord::Migration
  def change
    add_column :reports, :draft, :boolean, default: false
  end
end
