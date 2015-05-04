class AddDirectShareholderToShareholderRelationships < ActiveRecord::Migration
  def change
    add_column :shareholder_relationships, :direct_shareholder, :string
  end
end
