class CreateFlowsPayableUnderContracts < ActiveRecord::Migration
  def change
    create_table :flows_payable_under_contracts do |t|
      t.references :drc_company, index: true, foreign_key: true
      t.integer :signature_bonus
      t.integer :royalties
      t.integer :annuity
      t.integer :transfer_of_shares
      t.string :contract_cash_recipient

      t.timestamps null: false
    end
  end
end
