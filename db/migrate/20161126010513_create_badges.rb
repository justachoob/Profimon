class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.integer :profile_id
      t.string :subject
      t.boolean :finished, :default => false
      t.integer :firstYear, :default => 0
      t.integer :secondYear, :default => 0
      t.integer :thirdYear, :default => 0
      t.integer :fourthYear, :default => 0
      t.timestamps
    end
  end
end
