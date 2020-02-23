class HomesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  #load_and_authorize_resource
  def index
  	@flights = Flight.all
  	@flight = Flight.new
    @airports = Airport.all.map { |airport| [airport.name, airport.id] }
    @dates = Flight.order("flight_time asc").all.map { |flight| [flight.flight_time.strftime("%d/%m/%Y")] }.uniq
    @passengers = [1, 2, 3, 4]

    if !params[:flight].nil?
      @from = params[:flight][:from_airport]
      @to = params[:flight][:to_airport]
      @date = params[:flight][:date]
      @passengers_select = params[:flight][:passengers]
      @flights = Flight.search(@from, @to, @date)

      respond_to do |format|
        format.html
        format.js
      end
    end
    
  end
end
