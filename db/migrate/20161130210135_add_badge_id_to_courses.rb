class AddBadgeIdToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :badge_id, :integer
  end
end
