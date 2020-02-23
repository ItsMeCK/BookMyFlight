class PassengerBooking < ApplicationRecord
  belongs_to :passenger
  belongs_to :booking
  after_create :generate_pnr, :update_flight_seat_blocker

	# Class(1) + FlightNumber(3) + PassangerBookingID(4)
  validates_uniqueness_of :pnr_number, :allow_blank => true, :allow_nil => true
	def generate_pnr
		pnr = (passenger.seat_class.try(:[], 0) || 'F').to_s + (("%04d" % (booking.flight.id % (1000)))).to_s + ("%04d" % (id % 10000)).to_s
		self.update!(pnr_number: pnr)  
	end

	def update_flight_seat_blocker
		Flight.update_blocked_seats(-1)
	end

	def self.parse_pnr(pnr)
		find(pnr[5..8].to_i)
	end

	def allocate_seat(seat)
	    if PassengerBooking.where(seat_number: seat).find {|b| booking.flight.id == b.booking.flight.id}
	      "Seat #{seat} is booked. Please refresh page and try again"
			else
	      update!(seat_number: seat)
	      nil
	    end
	end
end
