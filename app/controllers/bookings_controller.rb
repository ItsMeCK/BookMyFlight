class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = current_user.bookings
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @flight = @booking.flight
  end

  # GET /bookings/new
  def new
    @flight = Flight.find(params[:flight_selected])
    Flight.update_blocked_seats(params[:passenger_count].to_i)
    @booking = Booking.new
    params[:passenger_count].to_i.to_i.times do
      @booking.passengers.build
    end
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def view_seat
    flight_availability = Flight.get_flight_from_pnr(params[:pnr]).generate_seat_availabilty_ui
    @flight_map = flight_availability[:flight_map]
    @flightallocated = flight_availability[:allocated]
    @pnr = params[:pnr]
  end

  def allocate_seat
    pnr = params[:pnr]
    selected_seat = params[:selected]
    errors = Booking.allocate_seat({pnr: pnr, seat: selected_seat})
    @booking = Booking.parse_pnr(pnr)
    respond_to do |format|
      if errors.nil?
        format.html { redirect_to @booking, notice: 'Seat has been successfully allocated.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { redirect_to bookings_view_seat_path(pnr: params[:pnr]), notice: errors}
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email, :seat_class])
    end
end
