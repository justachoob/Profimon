class AddSecondYearToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :secondYear, :integer
  end
end
