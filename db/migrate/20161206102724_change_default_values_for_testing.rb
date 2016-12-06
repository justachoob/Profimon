class ChangeDefaultValuesForTesting < ActiveRecord::Migration[5.0]
  def change
    change_column_default :profiles, :year, 4
    change_column_default :profiles, :yearProgress, 3
  end
end
