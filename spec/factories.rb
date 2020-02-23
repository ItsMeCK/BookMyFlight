FactoryBot.define do
  
  factory :user do
    email "test1@test.com"
    password "123456"
  end

  factory :airport do 
  	name 'Mumbai'
  	code 'MOM'
  	address 'Mumbai'
  end

  factory :flight do
  	airplane_type 'XYZ 123'
  	departure_airport_id 1
  	destination_airport_id 2
  	flight_time Date.today
  end

  factory :passenger do
  	email 'test@test.com'
  	name 'test'
  end

  factory :booking do
  	flight_id 1
  	user_id 1
  end

  factory :passenger_booking do
  	passenger_id 1
  	booking_id 1
  	pnr_number 1234
  	seat_number 1235
  end
  
end