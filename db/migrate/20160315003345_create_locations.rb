class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.st_point :lonlat
      t.string :description

      t.timestamps
    end
  end
end
