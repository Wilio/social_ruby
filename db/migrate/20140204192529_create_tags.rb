class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string "name", limit: 30, null: false
      t.timestamps
    end

    create_table :tags_clubs, :id => false do |t|
      t.belongs_to :tag, null: false
      t.belongs_to :club, null: false
    end

    create_table :tags_posts, :id => false do |t|
      t.belongs_to :tag, null: false
      t.belongs_to :post, null: false
    end
   
  end
end
