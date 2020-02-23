require "rails_helper"

RSpec.describe PassengerBookingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/passenger_bookings").to route_to("passenger_bookings#index")
    end

    it "routes to #new" do
      expect(:get => "/passenger_bookings/new").to route_to("passenger_bookings#new")
    end

    it "routes to #show" do
      expect(:get => "/passenger_bookings/1").to route_to("passenger_bookings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/passenger_bookings/1/edit").to route_to("passenger_bookings#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/passenger_bookings").to route_to("passenger_bookings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/passenger_bookings/1").to route_to("passenger_bookings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/passenger_bookings/1").to route_to("passenger_bookings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/passenger_bookings/1").to route_to("passenger_bookings#destroy", :id => "1")
    end
  end
end
