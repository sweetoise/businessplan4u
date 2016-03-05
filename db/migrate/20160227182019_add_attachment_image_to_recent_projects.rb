class AddAttachmentImageToRecentProjects < ActiveRecord::Migration
  def self.up
    change_table :recent_projects do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :recent_projects, :image
  end
end
