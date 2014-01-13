class CreateTmpUsers < ActiveRecord::Migration
  def change
    create_table :tmp_users, :id => false do |t|
      t.text "username", limit: 20, null: false
      t.text "password", null: false
      t.text "salt", null: false
      t.text "email", limit: 70, null: false
      t.text "auth_key", null: false
      t.timestamps
    end
  add_index :tmp_users, [:username, :email], :unique => true
  end
end
