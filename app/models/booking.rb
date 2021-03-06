class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passenger_bookings
  has_many :passengers, through: :passenger_bookings
  belongs_to :user
  accepts_nested_attributes_for :passengers


  #opts = {pnr: pnr, seat: selected_seat}
  def self.allocate_seat(opts={})
  	PassengerBooking.parse_pnr(opts[:pnr]).allocate_seat(opts[:seat])
  end

  def self.parse_pnr(pnr)
  	PassengerBooking.parse_pnr(pnr).booking
  end

  def booking_total_price
    passengers.map(&:seat_class).inject(0) {|total, seat_class| total + flight.seat_configurations.where(category: seat_class).try(:first).try(:price).to_f}
  end
  
end
