class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.decimal :number, :precision => 2, :scale => 1
      t.integer :section_id
      t.integer :sample_business_plan_id

      t.timestamps null: false
    end
  end
end
