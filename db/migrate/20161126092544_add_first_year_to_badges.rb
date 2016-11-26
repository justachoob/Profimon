class AddFirstYearToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :firstYear, :integer
  end
end
