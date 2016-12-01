class AddProgressToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :progress, :integer, :default => 0
  end
end
