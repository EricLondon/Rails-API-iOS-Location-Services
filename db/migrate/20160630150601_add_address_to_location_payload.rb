class AddAddressToLocationPayload < ActiveRecord::Migration
  def change
    add_column :location_payloads, :address, :string
  end
end
