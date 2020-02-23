require 'rails_helper'

RSpec.describe "passengers/new", type: :view do
  before(:each) do
    assign(:passenger, Passenger.new(
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new passenger form" do
    render

    assert_select "form[action=?][method=?]", passengers_path, "post" do

      assert_select "input[name=?]", "passenger[name]"

      assert_select "input[name=?]", "passenger[email]"
    end
  end
end
