json.extract! seat_configuration, :id, :category, :seat_in_row, :no_of_rows, :price, :flight_id, :created_at, :updated_at
json.url seat_configuration_url(seat_configuration, format: :json)
