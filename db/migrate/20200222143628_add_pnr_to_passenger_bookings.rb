class AddPnrToPassengerBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :passenger_bookings, :pnr_number, :string
 	add_column :passenger_bookings, :seat_number, :string
 	add_column :passenger_bookings, :seat_class, :string

  end
end
