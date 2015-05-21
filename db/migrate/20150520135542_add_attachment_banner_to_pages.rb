class AddAttachmentBannerToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :pages, :banner
  end
end
