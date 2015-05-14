class ChangeDataTypeForShareholderRelationship < ActiveRecord::Migration
  def change_table 
    remove_column :shareholder_relationships, :percentage, :integer 
    add_column :shareholder_relationships, :percentage, :float
   end
end
