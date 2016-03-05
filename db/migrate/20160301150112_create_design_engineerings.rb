class CreateDesignEngineerings < ActiveRecord::Migration
  def change
    create_table :design_engineerings do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
