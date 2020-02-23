module BookingsHelper
	def format_availability(availability)
		res = ""
		availability.each do |type,seats|
			res += "<b>#{type}:</b> #{seats} <br>"
		end
		res.html_safe
	end
end
