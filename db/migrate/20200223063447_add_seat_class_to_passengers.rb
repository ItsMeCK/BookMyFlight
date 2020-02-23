class AddSeatClassToPassengers < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :seat_class, :string
  end
end
