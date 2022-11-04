# frozen_string_literal: true

require 'date'

class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[show edit update destroy]
  before_action :set_assignment_id, only: %i[picked_up dropped_off notes]

  # GET /assignments or /assignments.json
  def index
    @assignments = Assignment.all.order('assignment_id ASC')
  end
  
  # GET /requests/riding
  def riding
  end
  
  # GET /requests/done
  def done
  end

  # GET /assignments/1 or /assignments/1.json
  def show
    @request = Request.find_by(request_id: @assignment.request_id)
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new

    # added for select field
    @valid_requests = Request.where(request_status: 'Unassigned')
  end

  # GET /assignments/1/edit
  def edit; end

  # POST /assignments or /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        # update the entire queue and the status of the appropriate request
        @request = Request.find_by_request_id(@assignment.request_id)
		Request.where('queue_pos > :pos', pos: @request.queue_pos).each do |request|
          request.update_attribute(:queue_pos, request.queue_pos - 1)
        end
    	@request.update_attribute(:queue_pos, 0)
        @request.update_attribute(:request_status, 'Assigned Driver')

        format.html { redirect_to assignment_url(@assignment), notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1 or /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to assignment_url(@assignment), notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /assignments/1/picked_up
  def picked_up
    @assignment.update_attribute(:pick_up_time, DateTime.now.strftime('%d/%m/%Y %H:%M'))

    respond_to do |format|
      format.html { redirect_to assignment_url(@assignment), notice: 'Assignment was successfully updated.' }
      format.json { head :no_content }
    end
  end

  # POST /assignments/1/dropped_off
  def dropped_off
    @assignment.update_attribute(:drop_off_time, DateTime.now.strftime('%d/%m/%Y %H:%M'))

    respond_to do |format|
      format.html { redirect_to assignment_url(@assignment), notice: 'Assignment was successfully updated.' }
      format.json { head :no_content }
    end
  end

  # GET /assignments/1/notes
  def notes; end

  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
  
  def set_assignment_id
    @assignment = Assignment.find(params[:assignment_id])
  end

  # Only allow a list of trusted parameters through.
  def assignment_params
    params.require(:assignment).permit(:request_id, :car_id, :notes)
  end
end
