class ChangeDepositResources < ActiveRecord::Migration
  def change
    change_table :deposit_resources do |t|
      t.remove :metal_content,:tonnage
      t.float :metal_content
      t.float :tonnage
    end
  end
end
