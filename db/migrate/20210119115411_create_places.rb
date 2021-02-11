class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :category
      t.string :group
      t.string :address
      t.string :gmap_place_id
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.string :opening_hours
      t.string :prefecture

      t.timestamps
    end
  end
end
