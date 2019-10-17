class AddDepositSourceToDeposits < ActiveRecord::Migration
  def change
    add_reference :deposits, :deposit_source
    remove_column :deposits, :source, :string

  end
end
