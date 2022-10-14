require 'date'

class RiderAssignmentsController < ApplicationController
  before_action :set_rider, only: %i[ index ]

  # GET /assignments or /assignments.json
  def index
    @rider_requests = Request.where(rider_id: @rider)
  
    @queued_assignments = Assignment.where(request_id: @rider_requests).where.not(queue_pos: 0).order('queue_pos ASC')
	@other_assignments = Assignment.where(request_id: @rider_requests, queue_pos: 0).order('queue_pos ASC')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rider
      @rider = Rider.find(params[:rider_id])
    end
end
