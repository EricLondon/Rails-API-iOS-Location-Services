class AddSpeedToLocationPayloads < ActiveRecord::Migration
  def change
    add_column :location_payloads, :speed, :float, null: false
  end
end
