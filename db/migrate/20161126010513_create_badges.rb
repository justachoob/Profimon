class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.integer :profile_id
      t.string :subject
      t.boolean :finished, :default => false
      t.integer :first_year, :default => 0
      t.integer :second_year, :default => 0
      t.integer :third_year, :default => 0
      t.integer :fourth_year, :default => 0
      t.timestamps
    end
  end
end
