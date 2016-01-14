class CreateAnalytics < ActiveRecord::Migration
  def change
    create_table :analytics do |t|

      t.timestamps
      t.json :github_stats
      t.json :schools_stats
    end
  end
end
