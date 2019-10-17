class CreateMineralResources < ActiveRecord::Migration
  def change
    create_table :mineral_resources do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
