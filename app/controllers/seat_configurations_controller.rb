class SeatConfigurationsController < ApplicationController
  before_action :set_seat_configuration, only: [:show, :edit, :update, :destroy]

  # GET /seat_configurations
  # GET /seat_configurations.json
  def index
    @seat_configurations = SeatConfiguration.all
  end

  # GET /seat_configurations/1
  # GET /seat_configurations/1.json
  def show
  end

  # GET /seat_configurations/new
  def new
    @seat_configuration = SeatConfiguration.new
  end

  # GET /seat_configurations/1/edit
  def edit
  end

  # POST /seat_configurations
  # POST /seat_configurations.json
  def create
    @seat_configuration = SeatConfiguration.new(seat_configuration_params)

    respond_to do |format|
      if @seat_configuration.save
        format.html { redirect_to @seat_configuration, notice: 'Seat configuration was successfully created.' }
        format.json { render :show, status: :created, location: @seat_configuration }
      else
        format.html { render :new }
        format.json { render json: @seat_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seat_configurations/1
  # PATCH/PUT /seat_configurations/1.json
  def update
    respond_to do |format|
      if @seat_configuration.update(seat_configuration_params)
        format.html { redirect_to @seat_configuration, notice: 'Seat configuration was successfully updated.' }
        format.json { render :show, status: :ok, location: @seat_configuration }
      else
        format.html { render :edit }
        format.json { render json: @seat_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seat_configurations/1
  # DELETE /seat_configurations/1.json
  def destroy
    @seat_configuration.destroy
    respond_to do |format|
      format.html { redirect_to seat_configurations_url, notice: 'Seat configuration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seat_configuration
      @seat_configuration = SeatConfiguration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seat_configuration_params
      params.require(:seat_configuration).permit(:category, :seat_in_row, :no_of_rows, :price, :flight_id)
    end
end
