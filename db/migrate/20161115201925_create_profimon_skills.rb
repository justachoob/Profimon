class CreateProfimonSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :profimon_skills do |t|
      t.string :name
      t.integer :stamina
      t.string :subject
      t.integer :knowledge
      t.integer :homework

      t.timestamps
    end
  end
end
