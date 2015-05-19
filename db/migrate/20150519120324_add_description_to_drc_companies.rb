class AddDescriptionToDrcCompanies < ActiveRecord::Migration
  def change
    add_column :drc_companies, :description, :text
  end
end
