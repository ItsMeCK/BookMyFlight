json.extract! passenger_booking, :id, :passenger_id, :booking_id, :created_at, :updated_at
json.url passenger_booking_url(passenger_booking, format: :json)
