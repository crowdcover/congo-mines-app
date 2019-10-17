class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.attachment :asset
      t.string :name
      t.references :attachable, polymorphic: true, index: true
      t.integer :position

      t.timestamps
    end
  end
end
