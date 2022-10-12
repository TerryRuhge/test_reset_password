class RidersController < ApplicationController
  before_action :set_rider, only: %i[ show edit update destroy ]

  # GET /riders or /riders.json
  def index
    @riders = Rider.all
  end

  # GET /riders/1 or /riders/1.json
  def show
  end

  # GET /riders/new
  def new
    @rider = Rider.new
  end

  # GET /riders/1/edit
  def edit
  end

  # POST /riders or /riders.json
  def create
    @rider = Rider.new(rider_params)

    respond_to do |format|
      if @rider.save
        format.html { redirect_to rider_url(@rider), notice: "Rider was successfully created." }
        format.json { render :show, status: :created, location: @rider }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /riders/1 or /riders/1.json
  def update
    respond_to do |format|
      if @rider.update(rider_params)
        format.html { redirect_to rider_url(@rider), notice: "Rider was successfully updated." }
        format.json { render :show, status: :ok, location: @rider }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riders/1 or /riders/1.json
  def destroy
    @rider.destroy

    respond_to do |format|
      format.html { redirect_to riders_url, notice: "Rider was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rider
      @rider = Rider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rider_params
      params.require(:rider).permit(:rider_id, :phone_number, :first_name, :last_name, :local_address)
    end
end
