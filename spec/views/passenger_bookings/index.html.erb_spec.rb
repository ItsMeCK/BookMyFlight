require 'rails_helper'

RSpec.describe "passenger_bookings/index", type: :view do
  before(:each) do
    assign(:passenger_bookings, [
      PassengerBooking.create!(
        :passenger_id => 2,
        :booking_id => 3
      ),
      PassengerBooking.create!(
        :passenger_id => 2,
        :booking_id => 3
      )
    ])
  end

  it "renders a list of passenger_bookings" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
