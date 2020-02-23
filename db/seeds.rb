# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = [Airport.create(name: "Chhatrapati Shivaji International Airport", code: 'BOM', address: "Mumbai, Maharashtra 400099"), 
	Airport.create(name: "Pune International Airport", code: 'PNQ', address: "Lohegaon, Pune, Maharashtra 400099"), 
	Airport.create(name: "Indira Gandhi International Airport", code: 'DEL', address: "Delhi"), 
	Airport.create(name: "Jolly Grant Airport, Dehradun", code: 'DED', address: "Airport Road, Dehradun")]

cat = ['Economy Class', 'First Class', 'Business Class', 'First Class']
3.times do |count|
	f = Flight.create(airplane_type: "BOEING 700", departure_airport_id: a[count].id , destination_airport_id: a[count + 1].id, flight_time: Date.today + count)
	SeatConfiguration.create(category: cat[count], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	SeatConfiguration.create(category: cat[count + 1], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	f = Flight.create(airplane_type: "BOEING 800", departure_airport_id: a[count].id, destination_airport_id: a[count + 1].id, flight_time: Date.today + count)
	SeatConfiguration.create(category: cat[count], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	SeatConfiguration.create(category: cat[count + 1], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	f = Flight.create(airplane_type: "BOEING 700", departure_airport_id: a[count].id, destination_airport_id: a[count + 1].id, flight_time: Date.today + count)
	SeatConfiguration.create(category: cat[count + 1], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	SeatConfiguration.create(category: cat[count], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	f = Flight.create(airplane_type: "BOEING 700", departure_airport_id: a[count].id, destination_airport_id: a[count + 1].id, flight_time: Date.today + count)
	SeatConfiguration.create(category: cat[count], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	SeatConfiguration.create(category: cat[count + 1], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)

end

3.downto(1).each do |count|
	f = Flight.create(airplane_type: "BOEING 700", departure_airport_id: a[count].id , destination_airport_id: a[count - 1].id, flight_time: Date.today + count)
	SeatConfiguration.create(category: cat[count], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	SeatConfiguration.create(category: cat[count + 1], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	f = Flight.create(airplane_type: "BOEING 800", departure_airport_id: a[count].id, destination_airport_id: a[count - 1].id, flight_time: Date.today + count)
	SeatConfiguration.create(category: cat[count], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	SeatConfiguration.create(category: cat[count + 1], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	f = Flight.create(airplane_type: "BOEING 700", departure_airport_id: a[count].id, destination_airport_id: a[count - 1].id, flight_time: Date.today + count)
	SeatConfiguration.create(category: cat[count], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	SeatConfiguration.create(category: cat[count + 1], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	f = Flight.create(airplane_type: "BOEING 700", departure_airport_id: a[count].id, destination_airport_id: a[count - 1].id, flight_time: Date.today + count)
	SeatConfiguration.create(category: cat[count], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)
	SeatConfiguration.create(category: cat[count + 1], seat_in_row: 5, no_of_rows: 5, price: count * 1000, flight_id: f.id)

end



