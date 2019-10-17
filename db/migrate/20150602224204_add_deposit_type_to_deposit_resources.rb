class AddDepositTypeToDepositResources < ActiveRecord::Migration
  def change
    add_column :deposit_resources, :deposit_type, :string,  index: true
    remove_column :deposit_resources, :resource, :string
    add_reference :deposit_resources, :depoable, index: true,  polymorphic: true
    add_reference :deposit_resources, :mineral_resource
    remove_column :deposit_resources, :deposit_id, :interger

    remove_column :deposits, :proven_reserves, :string
    remove_column :deposits, :probable_reserves, :string
    remove_column :deposits, :proven_probable_reserves, :string
    remove_column :deposits, :measured_resources, :string
    remove_column :deposits, :indicated_resources, :string
    remove_column :deposits, :inferred_resources, :string

    ['gold', 'copper', 'cobalt', 'zinc', 'silver', 'tin'].each do |name|
      MineralResource.find_or_create_by(name: name)
    end
  end
end
