class PassengerBooking < ApplicationRecord
  belongs_to :passenger
  belongs_to :booking
  after_create :generate_pnr, :update_flight_seat_blocker
  after_save :flush_cache_for_flight

	# Class(1) + FlightNumber(3) + PassangerBookingID(4)
	validate :pnr_and_seat_validatation
	def generate_pnr
		pnr = (passenger.seat_class.try(:[], 0) || 'F').to_s + (("%04d" % (booking.flight.id % (1000)))).to_s + ("%04d" % (id % 10000)).to_s
		self.update!(pnr_number: pnr)  
	end

	def update_flight_seat_blocker
		Flight.update_blocked_seats(-1)
	end

	def self.parse_pnr(pnr)
		where(id: pnr[5..8].to_i).first
	end

	def allocate_seat(seat)
	    if PassengerBooking.where(seat_number: seat).find {|b| booking.flight.id == b.booking.flight.id}
	      "Seat #{seat} is booked. Please refresh page and try again"
			else
	      update!(seat_number: seat)
	      nil
	    end
	end

	def self.validate_pnr(pnr, user)
		pb = parse_pnr(pnr)
		pb ? pb.booking.user.id == user : false
	end

	private

	def pnr_and_seat_validatation
		if pnr_number && PassengerBooking.where("pnr_number = ? and id <> ?", pnr_number, id).find {|b| booking.flight.id == b.booking.flight.id}
			errors.add(:pnr_number, "Already Taken") 
		end

		if seat_number && PassengerBooking.where("seat_number = ? and id <> ? ", seat_number, id).find {|b| booking.flight.id == b.booking.flight.id}
			errors.add(:seat_number, "Already Taken") 
		end
	end

	def flush_cache_for_flight
		Rails.cache.delete("Flight_#{booking.flight.id}_map")
	end
end
