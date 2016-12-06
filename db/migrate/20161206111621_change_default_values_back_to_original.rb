class ChangeDefaultValuesBackToOriginal < ActiveRecord::Migration[5.0]
  def change
    change_column_default :profiles, :year, 1
    change_column_default :profiles, :yearProgress, 0
  end
end
