class ChangePercentageOnShareholderRelationships < ActiveRecord::Migration
  def change
    change_column :shareholder_relationships, :percentage, :float
  end
end
