class CreateAuthentifications < ActiveRecord::Migration
  def change
    create_table :authentifications do |t|
      t.belongs_to :user,null: false
      t.text "auth_key", null: false
      t.timestamps
    end
  end
end
