class AddShareholderRelationshipEndYear < ActiveRecord::Migration
  def change
    add_column :shareholder_relationships, :year_end, :integer
  end
end
