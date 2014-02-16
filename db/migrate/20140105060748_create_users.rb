class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "username", limit: 20, null: false
      t.text "password", null: false
      t.text "email", limit: 100, null: false
      t.string "country", limit: 70
      t.date "birthday"
      t.text "salt", null: false
      t.boolean "is_auth"
      t.timestamps
    end

    create_table :users_clubs, :id => false  do |t|
      t.belongs_to :user, null: false
      t.belongs_to :club, null: false
      t.belongs_to :user_power, null: false
    end

   create_table :user_powers do |t|
      t.string "name", limit: 50, null: false
      t.text "description", null: false
   end

   add_index :users, [:username, :email], :unique => true
  end
end
