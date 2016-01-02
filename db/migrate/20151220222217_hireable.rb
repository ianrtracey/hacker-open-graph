class Hireable < ActiveRecord::Migration
  def change
  	remove_column :hackers, :looking_for_internship
  	add_column :hackers, :hireable, :boolean
  end
end
