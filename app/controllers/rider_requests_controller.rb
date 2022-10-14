class RiderRequestsController < ApplicationController
  before_action :set_rider, only: %i[index]
  before_action :set_request, only: %i[show edit update cancel]

  # GET /riders/1/index
  def index
    @other_requests = Request.where(rider_id: @rider).where.not(request_status: 'Cancelled').order('request_id ASC')
    @cancelled_requests = Request.where(rider_id: @rider, request_status: 'Cancelled').order('request_id ASC')
  end

  # GET /riders/1/show/1
  def show
  end

  # GET /requests/1/edit
  def edit
    @riders = Rider.order('last_name ASC').order('first_name ASC')
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
  
  def cancel
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

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_rider
    @rider = Rider.find(params[:rider_id])
  end

  def set_request
    @request = Request.find(params[:request_id])
  end
end
