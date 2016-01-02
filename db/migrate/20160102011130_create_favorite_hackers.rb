class CreateFavoriteHackers < ActiveRecord::Migration
  def change
    create_table :favorite_hackers do |t|

      t.timestamps
      t.integer :hacker_id
      t.integer :user_id
    end
  end
end
