require 'rails_helper'

RSpec.describe "SeatConfigurations", type: :request do
  describe "GET /seat_configurations" do
    it "works! (now write some real specs)" do
      get seat_configurations_path
      expect(response).to have_http_status(200)
    end
  end
end
