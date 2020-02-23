require 'rails_helper'

RSpec.describe "flights/edit", type: :view do
  before(:each) do
    @flight = assign(:flight, Flight.create!(
      :airplane_type => "MyString",
      :departure_airport_id => 1,
      :destination_airport_id => 1,
      :seat_allocation_id => "MyString"
    ))
  end

  it "renders the edit flight form" do
    render

    assert_select "form[action=?][method=?]", flight_path(@flight), "post" do

      assert_select "input[name=?]", "flight[airplane_type]"

      assert_select "input[name=?]", "flight[departure_airport_id]"

      assert_select "input[name=?]", "flight[destination_airport_id]"

      assert_select "input[name=?]", "flight[seat_allocation_id]"
    end
  end
end
