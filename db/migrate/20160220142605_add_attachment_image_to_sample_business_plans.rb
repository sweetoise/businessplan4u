class AddAttachmentImageToSampleBusinessPlans < ActiveRecord::Migration
  def self.up
    change_table :sample_business_plans do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sample_business_plans, :image
  end
end
