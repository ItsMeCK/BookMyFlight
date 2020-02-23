json.extract! passenger, :id, :name, :email, :dob, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)
