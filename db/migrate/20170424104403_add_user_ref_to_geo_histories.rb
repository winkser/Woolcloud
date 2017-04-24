class AddUserRefToGeoHistories < ActiveRecord::Migration[5.0]
  def change
    add_reference :geo_histories, :user, foreign_key: true
  end
end
