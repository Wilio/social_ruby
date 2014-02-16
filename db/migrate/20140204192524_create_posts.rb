class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "title", limit:	75, null: false
      t.text "content", limit: 1000, null: false
      t.belongs_to :user, null: false
      t.belongs_to :club, null: false
      t.timestamps
    end
  end
end
