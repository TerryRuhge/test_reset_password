# frozen_string_literal: true

class DriversController < ApplicationController
  before_action :set_driver, only: %i[show edit update destroy]

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
    params.fetch(:driver, {})
  end
end
