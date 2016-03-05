class AddAttachmentImageToBusinessManagements < ActiveRecord::Migration
  def self.up
    change_table :business_managements do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :business_managements, :image
  end
end
