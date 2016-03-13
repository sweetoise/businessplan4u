class CreateSampleBusinessPlans < ActiveRecord::Migration
  def change
    create_table :sample_business_plans do |t|
      t.string :title
      t.text   :description
      t.boolean :checked, :default => nil

      t.timestamps null: false
    end
  end
end
