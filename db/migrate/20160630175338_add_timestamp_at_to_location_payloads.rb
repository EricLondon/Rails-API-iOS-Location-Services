class AddTimestampAtToLocationPayloads < ActiveRecord::Migration
  def change
    add_column :location_payloads, :timestamp_at, :datetime, null: false
  end
end
