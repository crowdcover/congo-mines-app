class ChangeImportTaxDutyInTaxObligations < ActiveRecord::Migration
  def change
    change_column :tax_obligations, :import_customs_duty, :integer
  end
end
