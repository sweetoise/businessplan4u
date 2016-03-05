class AddAttachmentImageToSolutions < ActiveRecord::Migration
  def self.up
    change_table :solutions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :solutions, :image
  end
end
