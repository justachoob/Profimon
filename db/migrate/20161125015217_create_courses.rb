class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :subject
      t.integer :course_number
      t.float :grade
      t.string :profimon_name
      t.integer :profile_id

      t.timestamps
    end
  end
end
