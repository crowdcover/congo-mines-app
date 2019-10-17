class ChangeTableEmployees < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.remove :direct_expat, :direct_congolese, :subcontractor_expat, :subcontractor_congolese
      t.integer :congolese_female
      t.integer :congolese_male
      t.integer :congolese_total
      t.integer :expat_female
      t.integer :expat_male
      t.integer :expat_total
    end
  end
end
