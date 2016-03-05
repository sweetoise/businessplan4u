class AddAttachmentImageToEngineeringMgmts < ActiveRecord::Migration
  def self.up
    change_table :engineering_mgmts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :engineering_mgmts, :image
  end
end
