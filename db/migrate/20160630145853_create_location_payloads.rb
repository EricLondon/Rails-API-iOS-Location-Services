class CreateLocationPayloads < ActiveRecord::Migration
  def change
    create_table :location_payloads do |t|

      t.timestamps null: false
    end
  end
end
