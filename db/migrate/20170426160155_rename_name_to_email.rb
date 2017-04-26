class RenameNameToEmail < ActiveRecord::Migration[5.0]
  def change
    rename_column :friends, :name, :email
  end
end
