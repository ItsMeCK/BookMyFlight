require 'rails_helper'

RSpec.describe "passengers/edit", type: :view do
  before(:each) do
    @passenger = assign(:passenger, Passenger.create!(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit passenger form" do
    render

    assert_select "form[action=?][method=?]", passenger_path(@passenger), "post" do

      assert_select "input[name=?]", "passenger[name]"

      assert_select "input[name=?]", "passenger[email]"
    end
  end
end
