class AddVisibilityToReports < ActiveRecord::Migration
  def change
    add_column :reports, :visibility, :string
  end
end
