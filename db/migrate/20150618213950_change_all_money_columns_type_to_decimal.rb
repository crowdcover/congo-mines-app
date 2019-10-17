class ChangeAllMoneyColumnsTypeToDecimal < ActiveRecord::Migration
  def up
    change_column :env_and_social_obligations, :social_investment, :float

    change_column :flows_payable_under_contracts, :signature_bonus, :float
    change_column :flows_payable_under_contracts, :royalties, :float
    change_column :flows_payable_under_contracts, :annuity, :float
    change_column :flows_payable_under_contracts, :transfer_of_shares, :float

    change_column :production_exports, :grade, :float

    change_column :social_projects, :amount_planned, :float
    change_column :social_projects, :amount_spent, :float

    change_column :tax_obligations, :total_paid, :float
    change_column :tax_obligations, :redevance, :float
    change_column :tax_obligations, :ibp, :float
    change_column :tax_obligations, :import_customs_duty, :float
    change_column :tax_obligations, :surface_rights, :float
    change_column :tax_obligations, :signature_bonus, :float
    change_column :tax_obligations, :royalties, :float
    change_column :tax_obligations, :other, :float
  end

  def down
    change_column :env_and_social_obligations, :social_investment, :integer

    change_column :flows_payable_under_contracts, :signature_bonus, :integer
    change_column :flows_payable_under_contracts, :royalties, :integer
    change_column :flows_payable_under_contracts, :annuity, :integer
    change_column :flows_payable_under_contracts, :transfer_of_shares, :integer

    change_column :production_exports, :grade, :integer

    change_column :social_projects, :amount_planned, :integer
    change_column :social_projects, :amount_spent, :integer

    change_column :tax_obligations, :total_paid, :integer
    change_column :tax_obligations, :redevance, :integer
    change_column :tax_obligations, :ibp, :integer
    change_column :tax_obligations, :import_customs_duty, :integer
    change_column :tax_obligations, :surface_rights, :integer
    change_column :tax_obligations, :signature_bonus, :integer
    change_column :tax_obligations, :royalties, :integer
    change_column :tax_obligations, :other, :integer
  end
end
