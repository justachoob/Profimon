class CreateCoursesTakens < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_takens do |t|
      t.string :profile_id
      t.float :grade_earned
      t.string :course_subject
      t.integer :course_number
      t.string :profimon_name

      t.timestamps
    end
  end
end
