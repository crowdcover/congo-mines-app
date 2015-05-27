class AddDrcCompanyIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :drc_company_id, :integer
    add_index :pages, :drc_company_id
  end
end
