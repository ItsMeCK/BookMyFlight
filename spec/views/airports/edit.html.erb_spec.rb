require 'rails_helper'

RSpec.describe "airports/edit", type: :view do
  before(:each) do
    @airport = assign(:airport, Airport.create!(
      :name => "MyString",
      :code => "MyString",
      :address => "MyString"
    ))
  end

  it "renders the edit airport form" do
    render

    assert_select "form[action=?][method=?]", airport_path(@airport), "post" do

      assert_select "input[name=?]", "airport[name]"

      assert_select "input[name=?]", "airport[code]"

      assert_select "input[name=?]", "airport[address]"
    end
  end
end
