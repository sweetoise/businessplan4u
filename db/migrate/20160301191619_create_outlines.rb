class CreateOutlines < ActiveRecord::Migration
  def change
    create_table :outlines do |t|
      t.string :question
      t.integer :entrepreneur_program_id

      t.timestamps null: false
    end
  end
end
