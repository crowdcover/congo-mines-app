class ChangeShareholders < ActiveRecord::Migration
  def change
      change_table :shareholders do |t|
      t.remove :community_fund, :community_dialogue_platform
  
      t.string :community_fund
      t.string :community_dialogue_platform
    end
  end
end
