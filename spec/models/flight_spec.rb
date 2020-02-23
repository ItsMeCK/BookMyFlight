require 'rails_helper'

RSpec.describe Flight, type: :model do
  before(:all) do
  	@airport_from = create(:airport)
  	@airport_to = create(:airport, name: 'Pune', code: 'PN', address: 'Pune')
    @flight = create(:flight, departure_airport_id: @airport_from.id, destination_airport_id: @airport_to.id)
  end

  it "is valid with valid attributes" do
    expect(@flight).to be_valid
  end

  it "is not valid with same departure and destination" do
    flight_invalid = build(:flight, departure_airport_id: @airport_from.id, destination_airport_id: @airport_from.id)
    expect(flight_invalid).to_not be_valid
  end
end
