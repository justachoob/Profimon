class AddProfileIdToBadges < ActiveRecord::Migration[5.0]
  def change
    add_reference :badges, :profile, foreign_key: true
  end
end
