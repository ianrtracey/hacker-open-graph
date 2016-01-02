class AdditionalhackerInfo < ActiveRecord::Migration
  def change
  	add_column :hackers, :looking_for_internship, :boolean
  end
end
