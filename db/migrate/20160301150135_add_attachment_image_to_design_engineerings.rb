class AddAttachmentImageToDesignEngineerings < ActiveRecord::Migration
  def self.up
    change_table :design_engineerings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :design_engineerings, :image
  end
end
