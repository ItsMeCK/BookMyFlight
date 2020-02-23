require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(
        :flight => nil
      ),
      Booking.create!(
        :flight => nil
      )
    ])
  end

  it "renders a list of bookings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
