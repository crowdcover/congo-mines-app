class ChangeTaxObligations < ActiveRecord::Migration
  def change
    #def up
      #change_column :tax_obligations, :import_customs_duty, :integer
      
      change_table :tax_obligations do |t|
        t.change :import_customs_duty, :integer
      end
    #end

    #def down
    #  change_column :tax_obligations, :import_customs_duty, :boolean
    #end
  end
end

