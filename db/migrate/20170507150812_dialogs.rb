class Dialogs < ActiveRecord::Migration[5.0]
  def change
 
    create_table :dialogs do |t|
      t.string :name
      t.timestamps
    end

    create_table :messages do |t|
      t.belongs_to :dialog
      t.string :email
      t.string :message
      t.timestamps
    end
 
    create_table :dialogs_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :dialog, index: true
    end
  end
end
