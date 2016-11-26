class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.integer :profile_id
      t.string :subject
      t.boolean :finished
      t.integer :first_year
      t.integer :second_year
      t.integer :third_year
      t.integer :fourth_year
      t.timestamps
    end
  end
end
