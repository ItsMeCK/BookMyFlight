require "rails_helper"

RSpec.describe SeatConfigurationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/seat_configurations").to route_to("seat_configurations#index")
    end

    it "routes to #new" do
      expect(:get => "/seat_configurations/new").to route_to("seat_configurations#new")
    end

    it "routes to #show" do
      expect(:get => "/seat_configurations/1").to route_to("seat_configurations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/seat_configurations/1/edit").to route_to("seat_configurations#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/seat_configurations").to route_to("seat_configurations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/seat_configurations/1").to route_to("seat_configurations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/seat_configurations/1").to route_to("seat_configurations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/seat_configurations/1").to route_to("seat_configurations#destroy", :id => "1")
    end
  end
end
