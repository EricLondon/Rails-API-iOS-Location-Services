class AddUserIdToLocationPayloads < ActiveRecord::Migration
  def change
    add_reference :location_payloads, :user, foreign_key: true, null: false
  end
end
