class AddActualPostDateToReports < ActiveRecord::Migration
  def change
    add_column :reports, :actual_post_date, :date, index: true
   
  end
end


