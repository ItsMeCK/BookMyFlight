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

	def flight_price(flight)
		prices = {}
		flight.seat_configurations.each do |conf| 
			prices[conf.category] = conf.price
		end
		prices
	end	

	def format_prices(prices)
		res = ""
		prices.each do |type,price|
			res += "<b>#{type}:</b> Rs #{price} <br>"
		end
		res.html_safe
	end
end
