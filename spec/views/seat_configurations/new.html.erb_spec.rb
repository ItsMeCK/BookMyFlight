require 'rails_helper'

RSpec.describe "seat_configurations/new", type: :view do
  before(:each) do
    assign(:seat_configuration, SeatConfiguration.new(
      :category => "MyString",
      :seat_in_row => 1,
      :no_of_rows => 1,
      :price => 1.5,
      :flight => nil
    ))
  end

  it "renders new seat_configuration form" do
    render

    assert_select "form[action=?][method=?]", seat_configurations_path, "post" do

      assert_select "input[name=?]", "seat_configuration[category]"

      assert_select "input[name=?]", "seat_configuration[seat_in_row]"

      assert_select "input[name=?]", "seat_configuration[no_of_rows]"

      assert_select "input[name=?]", "seat_configuration[price]"

      assert_select "input[name=?]", "seat_configuration[flight_id]"
    end
  end
end
