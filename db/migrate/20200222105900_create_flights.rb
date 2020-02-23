class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :airplane_type
      t.integer :departure_airport_id
      t.integer :destination_airport_id
      t.string :seat_allocation_id
      t.datetime :flight_time

      t.timestamps
    end
  end
end
