class CreateDepositSources < ActiveRecord::Migration
  def change
    create_table :deposit_sources do |t|
      t.string :name

      t.timestamps null: false
    end
    
  end
end
