class AddFourthYearToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :fourthYear, :integer
  end
end
