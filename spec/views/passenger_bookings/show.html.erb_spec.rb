require 'rails_helper'

RSpec.describe "passenger_bookings/show", type: :view do
  before(:each) do
    @passenger_booking = assign(:passenger_booking, PassengerBooking.create!(
      :passenger_id => 2,
      :booking_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
