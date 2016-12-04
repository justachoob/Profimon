class AddGraduatedToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :graduated, :boolean, :default => false
  end
end
