require 'rails_helper'

RSpec.describe "seat_configurations/index", type: :view do
  before(:each) do
    assign(:seat_configurations, [
      SeatConfiguration.create!(
        :category => "Category",
        :seat_in_row => 2,
        :no_of_rows => 3,
        :price => 4.5,
        :flight => nil
      ),
      SeatConfiguration.create!(
        :category => "Category",
        :seat_in_row => 2,
        :no_of_rows => 3,
        :price => 4.5,
        :flight => nil
      )
    ])
  end

  it "renders a list of seat_configurations" do
    render
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
