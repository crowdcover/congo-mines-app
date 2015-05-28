class ChangeEmployeesTableAgain < ActiveRecord::Migration
  def change
   
    change_table :employees do |t|
      t.remove :congolese_male, :congolese_female,
        :expat_female, :expat_male, :congolese_total, :expat_total
        
      t.integer :count
      t.string :contract_type
      t.string :nationality
      t.string :gender
    end  
  end
end
