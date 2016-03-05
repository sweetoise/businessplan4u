class CreateEngineeringMgmts < ActiveRecord::Migration
  def change
    create_table :engineering_mgmts do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
