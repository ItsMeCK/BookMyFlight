require 'rails_helper'

RSpec.describe PassengerBooking, type: :model do
  before(:all) do
  	@user = create(:user, email: 'test4@test.com')
  	@airport_from = create(:airport)
  	@airport_to = create(:airport, name: 'Pune', code: 'PN', address: 'Pune')
    @flight = create(:flight, departure_airport_id: @airport_from.id, destination_airport_id: @airport_to.id)

  	@booking = create(:booking, user_id: @user.id, flight_id: @flight.id)
    @passenger = create(:passenger)
    @passenger_booking = create(:passenger_booking, passenger_id: @passenger.id, booking_id: @booking.id, seat_number: '5')
  end

  # it "seat number uniquiness" do
  # 	@booking2 =  create(:passenger_booking, passenger_id: @passenger.id, booking_id: @booking.id, seat_number: '5')
  #   expect(@booking2).to be_valid
  # end

  # it "is not valid without an email" do
  #   user2 = build(:user, email: nil)
  #   expect(user2).to_not be_valid
  # end
end
