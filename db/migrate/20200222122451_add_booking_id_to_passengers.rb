class AddBookingIdToPassengers < ActiveRecord::Migration[5.2]
  def change
    add_column :passangers, :booking_id, :integer
  end
end
