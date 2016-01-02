class AddAvatar < ActiveRecord::Migration
  def change
  	add_column :hackers, :avatar, :text
  end
end
