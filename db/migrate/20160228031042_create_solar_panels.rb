class CreateSolarPanels < ActiveRecord::Migration
  def change
    create_table :solar_panels do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
