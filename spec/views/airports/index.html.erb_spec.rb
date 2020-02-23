require 'rails_helper'

RSpec.describe "airports/index", type: :view do
  before(:each) do
    assign(:airports, [
      Airport.create!(
        :name => "Name",
        :code => "Code",
        :address => "Address"
      ),
      Airport.create!(
        :name => "Name",
        :code => "Code",
        :address => "Address"
      )
    ])
  end

  it "renders a list of airports" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
