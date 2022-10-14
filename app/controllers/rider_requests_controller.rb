class RiderRequestsController < ApplicationController
  before_action :set_rider, only: %i[ index cancel ]
  before_action :set_request, only: %i[ cancel ]

  # GET /riders/1/index
  def index
    @other_requests = Request.where(rider_id: @rider).where.not(request_status: 'Cancelled').order('request_id ASC')
    @cancelled_requests = Request.where(rider_id: @rider, request_status: 'Cancelled').order('request_id ASC')
  end
  
  def cancel
	@request.update_attribute(:request_status, 'Cancelled')
	
	# update the queue in assignment accordingly
	if @assignment = Assignment.where(request_id: @request.request_id).last
	  @assignment.update_attribute(:queue_pos, 0)
	end
	
	respond_to do |format|
      format.html { redirect_to rider_requests_url(@rider), notice: 'Request was successfully cancelled.' }
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
