class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.st_point :lonlat, geographic: true
      t.string :description

      t.timestamps
    end
    add_index :locations, :lonlat, using: :gist
  end
end
