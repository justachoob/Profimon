class UpdateSkills < ActiveRecord::Migration[5.0]
  def change
  	add_column :skills , :stamina, :integer
  	add_column :skills , :gpa_required, :float
  end
end
