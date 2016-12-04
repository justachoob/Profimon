class AddColumnsToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :year, :integer, :default => 1
    add_column :profiles, :yearProgress, :integer, :default => 0 
  end
end
