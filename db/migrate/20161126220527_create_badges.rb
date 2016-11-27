class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.string :subject
      t.integer :profile_id
      t.boolean :completed, :default => false
      t.integer :first_year, :default => 0
      t.integer :second_year, :default => 0
      t.integer :third_year, :default => 0
      t.integer :fourth_year, :default => 0

      t.timestamps
    end
  end
end
