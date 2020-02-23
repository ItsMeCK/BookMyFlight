require 'rails_helper'

RSpec.describe "seat_configurations/show", type: :view do
  before(:each) do
    @seat_configuration = assign(:seat_configuration, SeatConfiguration.create!(
      :category => "Category",
      :seat_in_row => 2,
      :no_of_rows => 3,
      :price => 4.5,
      :flight => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(//)
  end
end
