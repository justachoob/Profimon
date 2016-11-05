class AddUserIdToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :UserId, :string
  end
end
