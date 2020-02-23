require 'rails_helper'

RSpec.describe "passenger_bookings/new", type: :view do
  before(:each) do
    assign(:passenger_booking, PassengerBooking.new(
      :passenger_id => 1,
      :booking_id => 1
    ))
  end

  it "renders new passenger_booking form" do
    render

    assert_select "form[action=?][method=?]", passenger_bookings_path, "post" do

      assert_select "input[name=?]", "passenger_booking[passenger_id]"

      assert_select "input[name=?]", "passenger_booking[booking_id]"
    end
  end
end
