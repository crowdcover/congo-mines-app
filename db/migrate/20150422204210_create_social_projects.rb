class CreateSocialProjects < ActiveRecord::Migration
  def change
    create_table :social_projects do |t|
      t.references :drc_company, index: true, foreign_key: true
      t.string :company
      t.string :project_type
      t.integer :amount_planned
      t.integer :amount_spent
      t.string :stage
      t.text :description
      t.decimal  "lat", precision: 15, scale: 10
      t.decimal  "lng", precision: 15, scale: 10

      t.timestamps null: false
    end
  end
end
