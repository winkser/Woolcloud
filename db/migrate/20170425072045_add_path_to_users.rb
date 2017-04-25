class AddPathToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :path, :string
  end
end
