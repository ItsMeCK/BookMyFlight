require 'rails_helper'

RSpec.describe "PassengerBookings", type: :request do
  describe "GET /passenger_bookings" do
    it "works! (now write some real specs)" do
      get passenger_bookings_path
      expect(response).to have_http_status(200)
    end
  end
end
