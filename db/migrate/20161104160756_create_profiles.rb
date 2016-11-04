class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :pname
      t.string :faculty
      t.float :current_gpa
      t.integer :num_of_courses_taken
      t.string :courses_taken
      t.string :badges

      t.timestamps
    end
  end
end
