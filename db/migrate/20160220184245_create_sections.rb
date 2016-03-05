class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :sample_business_plan_id

      t.timestamps null: false
    end
  end
end
