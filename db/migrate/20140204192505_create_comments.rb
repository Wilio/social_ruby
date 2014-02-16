class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
      t.belongs_to :comment, null: false
      t.text "content", limit: 500, null: false		
      t.timestamps
    end
  end
end
