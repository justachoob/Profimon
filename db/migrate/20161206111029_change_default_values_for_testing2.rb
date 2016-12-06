class ChangeDefaultValuesForTesting2 < ActiveRecord::Migration[5.0]
  def change
    change_column_default :profiles, :year, 3
    change_column_default :profiles, :yearProgress, 0
  end
end
