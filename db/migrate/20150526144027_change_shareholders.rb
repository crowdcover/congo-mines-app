class ChangeShareholders < ActiveRecord::Migration
  def change
      change_table :shareholders do |t|
      t.remove  :stock, :public_private
  
      t.string :stock
      t.string :public_private
    end
  end
end
