class AddAttachmentImageToSolarPanels < ActiveRecord::Migration
  def self.up
    change_table :solar_panels do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :solar_panels, :image
  end
end
