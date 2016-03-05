class CreateOurAdvantages < ActiveRecord::Migration
  def change
    create_table :our_advantages do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
