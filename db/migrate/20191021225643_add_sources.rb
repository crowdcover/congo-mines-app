class AddSources < ActiveRecord::Migration
  def change
    add_reference :tax_obligations, :source, foreign_key: true
    add_reference :shareholders, :source, foreign_key: true
    add_reference :shareholder_relationships, :source, foreign_key: true
    add_reference :social_projects, :source, foreign_key: true
    add_reference :employees, :source, foreign_key: true
    add_reference :production_exports, :source, foreign_key: true
    add_reference :env_and_social_obligations, :source, foreign_key: true
    add_reference :flows_payable_under_contracts, :source, foreign_key: true
    add_reference :processing_infrastructures, :source, foreign_key: true
  end
end
