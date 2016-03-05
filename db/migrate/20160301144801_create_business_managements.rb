class CreateBusinessManagements < ActiveRecord::Migration
  def change
    create_table :business_managements do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
