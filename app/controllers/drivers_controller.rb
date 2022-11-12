# frozen_string_literal: true

class DriversController < ApplicationController
  before_action :set_driver, only: %i[show edit update destroy]
  before_action :authenticate_driver!, only: :checkin
  # GET /drivers or /drivers.json
  def index
    @drivers = Driver.all
  end

  # GET /driver/1 or /driver/1.json
  def show; end

  # GET /driver/new
  def new
    @driver = Driver.new
  end

  # GET /driver/1/edit
  def edit; end

  # POST /driver or /driver.json
  def create
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        format.html { redirect_to driver_url(@driver), notice: 'Driver was successfully created.' }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /driver/1 or /driver/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to driver_url(@driver), notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /driver/1 or /driver/1.json
  def destroy
    @driver.destroy

    respond_to do |format|
      format.html { redirect_to driver_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /driver/checkin
  def checkin
    @driver1 = Driver.find(Member.find(params[:id]).member_id)
    @driver1.update(driver_status: :driver_status, check_in_time: DateTime.now)
    redirect_to drivers_checkin_path
  end

  #Create Driver from ndr
  def join_request(ndr_id)
    @driver = Driver.new(member_id: current_member.member_id, ndr_id: ndr_id)
    @driver.save
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_driver
    @driver = Driver.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def driver_params
    params.require(:driver).permit(:member_id, :car_id, :check_in_time, :driver_status, :ndr_id)
  end

  #Makes sure an NDR is active and the current member is signed up as a driver
  def authenticate_driver!
    redirect_to ndrs_path, notice: "Please Sign up for the ndr to view your check-in" if !Driver.where(:member_id => current_member.member_id).where(:ndr_id => Ndr.find_by(:is_active => true).ndr_id).nil?
  end

  #Makes sure an NDR is active and the current member is signed up as a driver
  def authenticate_driver!
    redirect_to ndrs_path, notice: "Please Sign up for the ndr to view your check-in" if !Driver.where(:member_id => current_member.member_id).where(:ndr_id => Ndr.find_by(:is_active => true).ndr_id).nil?
  end
end
