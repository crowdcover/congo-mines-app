class AddRecommendedToReports < ActiveRecord::Migration
  def change
    add_column :reports, :recommended, :boolean
  end
end
