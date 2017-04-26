class AddConfirmToFriends < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :confirm, :string
  end
end
