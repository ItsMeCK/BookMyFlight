require 'rails_helper'

RSpec.describe "seat_configurations/edit", type: :view do
  before(:each) do
    @seat_configuration = assign(:seat_configuration, SeatConfiguration.create!(
      :category => "MyString",
      :seat_in_row => 1,
      :no_of_rows => 1,
      :price => 1.5,
      :flight => nil
    ))
  end

  it "renders the edit seat_configuration form" do
    render

    assert_select "form[action=?][method=?]", seat_configuration_path(@seat_configuration), "post" do

      assert_select "input[name=?]", "seat_configuration[category]"

      assert_select "input[name=?]", "seat_configuration[seat_in_row]"

      assert_select "input[name=?]", "seat_configuration[no_of_rows]"

      assert_select "input[name=?]", "seat_configuration[price]"

      assert_select "input[name=?]", "seat_configuration[flight_id]"
    end
  end
end
