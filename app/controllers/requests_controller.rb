# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :set_request, only: %i[show edit update destroy]
  before_action :set_request_id, only: %i[status done cancel]

  # GET /requests or /requests.json
  def index
    @requests = Request.all.order('request_id ASC')
  end
  
  # GET /requests/waiting
  def waiting
    @requests = Request.where(request_status: 'Unassigned').order('created_at ASC')
  end

  # GET /requests/1 or /requests/1.json
  def show; end

  # GET /requests/new
  def new
    @request = Request.new
  end
  
  # GET /requests/incoming
  def incoming
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit; end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        # update the queue position of the request
        next_queue_pos = Request.where(request_status: 'Unassigned').count + 1
        @request.update_attribute(:queue_pos, next_queue_pos)
        @request.update_attribute(:request_status, 'Unassigned')

	    if current_member
          format.html { redirect_to requests_waiting_url, notice: 'Request was successfully created.' }
          format.json { head :no_content }
        end

        # TODO: root_path needs to be replaced with the search feature
        format.html { redirect_to root_url, notice: 'Request was successfully created.' }
        format.json { head :no_content }
      else
	    if current_member
          format.html { render :incoming, status: :unprocessable_entity }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        # update the queue position accordingly, if request status is changed
        if (@request.request_status != 'Unassigned')
          @request.update_attribute(:queue_pos, 0)
        end

        if current_member
          format.html { redirect_to requests_waiting_url, notice: 'Request was successfully updated.' }
          format.json { head :no_content }
        end

        # TODO: root_path needs to be replaced with the search feature
        format.html { redirect_to root_url, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /requests/1/status
  def status; end

  # POST /requests/1/done
  def done
    @request.update_attribute(:request_status, 'Done')

    respond_to do |format|
      format.html { redirect_to assignments_done_path, notice: 'Request was successfully finished.' }
      format.json { head :no_content }
    end
  end


  # POST /requests/1/cancel
  def cancel
    # update the queue position of all requests later in the queue
    if @request.queue_pos.positive?
      Request.where('queue_pos > :pos', pos: @request.queue_pos).each do |request|
        request.update_attribute(:queue_pos, request.queue_pos - 1)
      end
    end
    
    @request.update_attribute(:queue_pos, 0)
    # request is declared missed if time waited greater than 30min
    if helpers.time_dur(@request) > 30
      @request.update_attribute(:request_status, 'Missed')
	else
	  @request.update_attribute(:request_status, 'Cancelled')
    end
	  
    respond_to do |format|
      if current_member
        format.html { redirect_back fallback_location: requests_waiting_url, notice: 'Request was successfully cancelled.' }
        format.json { head :no_content }
      end

      # TODO: root_path needs to be replaced with the search feature
      format.html { redirect_to root_url, notice: 'Request was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    # update the queue position of all requests later in the queue
    if @request.queue_pos.positive?
      Request.where('queue_pos > :pos', pos: @request.queue_pos).each do |request|
        request.update_attribute(:queue_pos, request.queue_pos - 1)
      end
    end
    
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
  
  def set_request_id
    @request = Request.find(params[:request_id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:name, :phone_number, :request_status, :pick_up_loc, :drop_off_loc, :num_passengers, :additional_info)
  end
end
