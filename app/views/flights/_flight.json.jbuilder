json.extract! flight, :id, :airplane_type, :departure_airport_id, :destination_airport_id, :seat_allocation_id, :flight_time, :created_at, :updated_at
json.url flight_url(flight, format: :json)
