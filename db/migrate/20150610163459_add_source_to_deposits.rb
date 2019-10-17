class AddSourceToDeposits < ActiveRecord::Migration
  def change
    add_column :deposits, :source, :string
  end
end
