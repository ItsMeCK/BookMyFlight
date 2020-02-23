require 'rails_helper'

RSpec.describe "flights/show", type: :view do
  before(:each) do
    @flight = assign(:flight, Flight.create!(
      :airplane_type => "Airplane Type",
      :departure_airport_id => 2,
      :destination_airport_id => 3,
      :seat_allocation_id => "Seat Allocation"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Airplane Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Seat Allocation/)
  end
end
