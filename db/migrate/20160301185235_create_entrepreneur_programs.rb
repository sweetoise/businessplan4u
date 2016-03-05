class CreateEntrepreneurPrograms < ActiveRecord::Migration
  def change
    create_table :entrepreneur_programs do |t|
      t.string :topic
      t.text :description

      t.timestamps null: false
    end
  end
end
