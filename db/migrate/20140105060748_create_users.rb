class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text "username", limit: 20, null: false
      t.text "password", null: false
      t.text "salt", null: false
      t.text "email", limit: 70, null: false
      t.text "location", limit: 70
      t.timestamps
    end
   add_index :users, [:username, :email], :unique => true
  end
end
