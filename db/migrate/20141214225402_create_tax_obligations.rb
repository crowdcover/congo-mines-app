class CreateTaxObligations < ActiveRecord::Migration
  def change
    create_table :tax_obligations do |t|
      t.references :congolese_company, index: true
      t.integer :signature_bonus_payable
      t.string :formula_of
      t.string :royalties_payable
      t.string :formula_of_annuity_or_rent_to_pay
      t.integer :amount_for_transfer_of_shares
      t.string :recipient_of_the_contractual_cash_flows
      t.integer :year
      t.integer :total_amount_paid_according_to_company_EITI_declaration
      t.integer :royalties
      t.integer :declared_IBP
      t.integer :declared_customs_duty_on_imports
      t.integer :surface_rights_declared
      t.integer :signature_bonus_declared
      t.integer :declared_royalties
      t.string :other_contractual_flows_reported

      t.timestamps
    end
  end
end
