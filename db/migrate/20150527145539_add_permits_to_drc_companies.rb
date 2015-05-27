class AddPermitsToDrcCompanies < ActiveRecord::Migration
  def change
    add_column :drc_companies, :permits, :text
  end
end
