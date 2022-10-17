# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]

  # GET /requests or /requests.json
  def index
    @other_requests = Request.where.not(request_status: 'Cancelled').order('request_id ASC')
    @cancelled_requests = Request.where(request_status: 'Cancelled').order('request_id ASC')
  end

  # GET /requests/1 or /requests/1.json
  def show
    # added to display rider name
	@rider = Rider.find_by(rider_id: @request.rider_id)
  end

  # GET /requests/new
  def new
    @request = Request.new
	
	# added for select field
	@riders = Rider.order('last_name ASC').order('first_name ASC')
  end

  # GET /requests/1/edit
  def edit
    @riders = Rider.order('last_name ASC').order('first_name ASC')
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)
	
    respond_to do |format|
      if @request.save
	    # update the request status attribute
		@request.update_attribute(:request_status, 'Unassigned')
	  
        format.html { redirect_to request_url(@request), notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
	    # update the queue in assignment accordingly, if request status is changed
		if (@request.request_status != 'In Progress') && (@request.request_status != 'Unassigned')
		  @assignment = Assignment.where(request_id: @request.request_id).last
	      @assignment.update_attribute(:queue_pos, 0)
		end
	  
        format.html { redirect_to request_url(@request), notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def status
    @request = Request.find(params[:request_id])
  end
  
  def cancel
    @request = Request.find(params[:request_id])
	@request.update_attribute(:request_status, 'Cancelled')
	
	# update the queue in assignment accordingly
	if @assignment = Assignment.where(request_id: @request.request_id).last
	  @assignment.update_attribute(:queue_pos, 0)
	end
	
	respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:rider_id, :request_status, :date_time, :pick_up_loc, :num_passengers, :additional_info)
  end
end
