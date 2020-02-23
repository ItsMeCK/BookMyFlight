require 'rails_helper'

RSpec.describe "flights/new", type: :view do
  before(:each) do
    assign(:flight, Flight.new(
      :airplane_type => "MyString",
      :departure_airport_id => 1,
      :destination_airport_id => 1,
      :seat_allocation_id => "MyString"
    ))
  end

  it "renders new flight form" do
    render

    assert_select "form[action=?][method=?]", flights_path, "post" do

      assert_select "input[name=?]", "flight[airplane_type]"

      assert_select "input[name=?]", "flight[departure_airport_id]"

      assert_select "input[name=?]", "flight[destination_airport_id]"

      assert_select "input[name=?]", "flight[seat_allocation_id]"
    end
  end
end
