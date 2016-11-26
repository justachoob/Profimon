class AddThirdYearToBadges < ActiveRecord::Migration[5.0]
  def change
    add_column :badges, :thirdYear, :integer
  end
end
