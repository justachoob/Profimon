class AddDamageToSkills < ActiveRecord::Migration[5.0]
  def change
  	add_column :skills, :knowledge, :integer
  	add_column :skills, :homework, :integer
  end
end
