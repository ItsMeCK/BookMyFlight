require 'rails_helper'

RSpec.describe "flights/index", type: :view do
  before(:each) do
    assign(:flights, [
      Flight.create!(
        :airplane_type => "Airplane Type",
        :departure_airport_id => 2,
        :destination_airport_id => 3,
        :seat_allocation_id => "Seat Allocation"
      ),
      Flight.create!(
        :airplane_type => "Airplane Type",
        :departure_airport_id => 2,
        :destination_airport_id => 3,
        :seat_allocation_id => "Seat Allocation"
      )
    ])
  end

  it "renders a list of flights" do
    render
    assert_select "tr>td", :text => "Airplane Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Seat Allocation".to_s, :count => 2
  end
end
