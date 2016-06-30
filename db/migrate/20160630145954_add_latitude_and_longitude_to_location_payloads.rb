class AddLatitudeAndLongitudeToLocationPayloads < ActiveRecord::Migration
  def change
    add_column :location_payloads, :latitude, :float, null: false
    add_column :location_payloads, :longitude, :float, null: false
  end
end
