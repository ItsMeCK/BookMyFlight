require 'rails_helper'

RSpec.describe "airports/new", type: :view do
  before(:each) do
    assign(:airport, Airport.new(
      :name => "MyString",
      :code => "MyString",
      :address => "MyString"
    ))
  end

  it "renders new airport form" do
    render

    assert_select "form[action=?][method=?]", airports_path, "post" do

      assert_select "input[name=?]", "airport[name]"

      assert_select "input[name=?]", "airport[code]"

      assert_select "input[name=?]", "airport[address]"
    end
  end
end
