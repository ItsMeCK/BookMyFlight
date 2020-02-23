module FlightsHelper
	def seat_available(flight)
		availablity = {}
		flight.seat_configurations.each do |conf| 
			availablity[conf.category] = conf.no_of_rows * conf.seat_in_row - flight.availability
		end
		availablity
	end

	def flight_all_class(flight)
		flight.seat_configurations.map(&:category)
	end
end
