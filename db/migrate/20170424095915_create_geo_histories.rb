class CreateGeoHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :geo_histories do |t|
      t.float :cord_x
      t.float :cord_y

      t.timestamps
    end
  end
end
