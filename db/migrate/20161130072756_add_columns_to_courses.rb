class AddColumnsToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :badge_id, :integer
    add_column :courses, :status, :integer, :default => 0
    add_column :courses, :timesTaken, :integer, :default => 1
  end
end
