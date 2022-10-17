require 'date'

class RiderAssignmentsController < ApplicationController
  before_action :set_rider, only: %i[ index queue cancel ]
  before_action :set_request, only: %i[ cancel ]

  # GET /assignments or /assignments.json
  def index
    @rider_requests = Request.where(rider_id: @rider)
  
    @queued_assignments = Assignment.where(request_id: @rider_requests).where.not(queue_pos: 0).order('queue_pos ASC')
	@other_assignments = Assignment.where(request_id: @rider_requests, queue_pos: 0).order('queue_pos ASC')
  end
  
  def queue
    @rider_inprogress_requests = Request.where(rider_id: @rider, request_status: 'In Progress')
	@rider_unassigned_requests = Request.where(rider_id: @rider, request_status: 'Unassigned')
  
    @queued_assignments = Assignment.where(request_id: @rider_inprogress_requests).order('queue_pos ASC')
  end
  
  def cancel
	@request.update_attribute(:request_status, 'Cancelled')
	
	# update the queue in assignment accordingly
	if @assignment = Assignment.where(request_id: @request.request_id).last
	  @assignment.update_attribute(:queue_pos, 0)
	end
	
	respond_to do |format|
      format.html { redirect_to rider_queue_url(@rider), notice: 'Request was successfully cancelled.' }
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
