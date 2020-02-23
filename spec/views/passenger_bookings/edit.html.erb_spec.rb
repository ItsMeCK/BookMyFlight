require 'rails_helper'

RSpec.describe "passenger_bookings/edit", type: :view do
  before(:each) do
    @passenger_booking = assign(:passenger_booking, PassengerBooking.create!(
      :passenger_id => 1,
      :booking_id => 1
    ))
  end

  it "renders the edit passenger_booking form" do
    render

    assert_select "form[action=?][method=?]", passenger_booking_path(@passenger_booking), "post" do

      assert_select "input[name=?]", "passenger_booking[passenger_id]"

      assert_select "input[name=?]", "passenger_booking[booking_id]"
    end
  end
end
