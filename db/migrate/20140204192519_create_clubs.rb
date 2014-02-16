class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string "name", limit: 50, null: false
      t.text "description", limit: 250
      t.string "stylesheet"
      t.timestamps
    end
    add_index :clubs, :name
  end
end
