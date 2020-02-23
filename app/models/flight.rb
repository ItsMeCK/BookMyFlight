class Flight < ApplicationRecord
	belongs_to :from_airport, class_name: 'Airport', foreign_key: :departure_airport_id
	belongs_to :to_airport, class_name: 'Airport', foreign_key: :destination_airport_id
	has_many :seat_configurations
	has_many :bookings

	@@blocked_seats = 0
	FLIGHT_MAP = {"first_class" => 'f', "business_class" => 'b', "economy_class" => 'e'}

	def self.update_blocked_seats(updater)
		@@blocked_seats += updater
	end

	def self.blocked_seats
		@@blocked_seats
	end
	
	def availability
		bookings.inject(0) do |count, booking|
			count + booking.passenger_bookings.count
		end + Flight.blocked_seats
	end

	#FLIGHT MAP
	# [
	  #   'fe_ff',
	  #   'ff_ff',
	  #   'ee_ee',
	  #   'ee_ee',
	  #   'ee___',
	  #   'ee_ee',
	  #   'ee_ee',
	  #   'ee_ee',
	  #   'eeeee',
	  # ]
	  # f stands first class
	  # e stands for economy
	  # b for business
	  # _ for space

	#BOOKED SEATS
	#['1_2', '4_1', '7_1', '7_2'] row_seat


	def generate_seat_availabilty_ui
		all_flight_bookings = bookings.map(&:passenger_bookings).flatten.compact
		allocated_booking_map = all_flight_bookings.select {|booking| booking.seat_number?}.map(&:seat_number)
		flight_map = []
		seat_configurations.each do |conf|
			conf.no_of_rows.times {flight_map << (FLIGHT_MAP[conf.category.gsub(' ', '_').downcase] * conf.seat_in_row)}
		end
		{allocated: allocated_booking_map, flight_map: flight_map}
	end

	def self.get_flight_from_pnr(pnr)
		find(pnr[1..4].to_i)
	end

	def self.search(from, to, date)
	  where(departure_airport_id: from, destination_airport_id: to, flight_time: Flight.format_date(date))
	end

	def self.format_date(date)
	  date = date.to_date
	  date.beginning_of_day..date.end_of_day
	end
end
