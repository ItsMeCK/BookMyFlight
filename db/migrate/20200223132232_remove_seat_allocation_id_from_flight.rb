class RemoveSeatAllocationIdFromFlight < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :seat_allocation_id, :integer
  end
end
