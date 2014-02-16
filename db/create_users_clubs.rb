class CreateAuthentifications < ActiveRecord::Migration
  def change
    create_table :users_clubs do |t|
      t.belogs_to :user
      t.belongs_to :club
    end
  end
end
