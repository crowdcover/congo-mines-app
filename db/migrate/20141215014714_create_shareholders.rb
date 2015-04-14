class CreateShareholders < ActiveRecord::Migration
  def change
    create_table :shareholders do |t|
      t.references :drc_company, index: true
      t.string :name
      t.string :acronym
      t.string :contact
      t.string :website
      t.boolean :stock
      t.string :public_private
      t.timestamps
    end
  end
end
