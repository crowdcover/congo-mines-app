class AddColumnCategoryIdToPage < ActiveRecord::Migration
  def change
    add_column :pages, :category_id, :integer
    add_index :pages, :category_id
  end
end
