# frozen_string_literal: true

require 'date'

class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[show edit update destroy]

  # GET /assignments or /assignments.json
  def index
    @queued_assignments = Assignment.where.not(queue_pos: 0).order('queue_pos ASC')
    @other_assignments = Assignment.where(queue_pos: 0).order('queue_pos ASC')
  end

  # GET /assignments/1 or /assignments/1.json
  def show
    @request = Request.find_by(request_id: @assignment.request_id)
    @rider = Rider.find_by(rider_id: @request.rider_id)
  end

  #GET /queue
  def show_all_queue
    @assignments = Assignment.where(queue_pos: !'0').order('queue_pos ASC')

    @requests = Request.where
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
        # update the queue position of the assignment
        if Assignment.count.positive?
          next_queue_pos = Assignment.where.not(queue_pos: 0).count + 1
          @assignment.update_attribute(:queue_pos, next_queue_pos)
        else
          @assignment.update_attribute(:queue_pos, 1)
        end

        # update the status in request accordingly
        @request = Request.where(request_id: @assignment.request_id).last
        @request.update_attribute(:request_status, 'In Progress')

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

  def picked_up
    @assignment = Assignment.find(params[:assignment_id])
    @assignment.update_attribute(:pick_up_time, DateTime.now.strftime('%d/%m/%Y %H:%M'))

    respond_to do |format|
      format.html { redirect_to assignment_url(@assignment), notice: 'Assignment was successfully updated.' }
      format.json { head :no_content }
    end
  end

  def dropped_off
    @assignment = Assignment.find(params[:assignment_id])
    @assignment.update_attribute(:drop_off_time, DateTime.now.strftime('%d/%m/%Y %H:%M'))

    respond_to do |format|
      format.html { redirect_to assignment_url(@assignment), notice: 'Assignment was successfully updated.' }
      format.json { head :no_content }
    end
  end

  def notes
    @assignment = Assignment.find(params[:assignment_id])
  end

  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    @assignment.destroy
    if @assignment.queue_pos.positive?
      Assignment.where('queue_pos > :pos', pos: @assignment.queue_pos).each do |assignment|
        assignment.update_attribute(:queue_pos, assignment.queue_pos - 1)
      end
    end

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

  # Only allow a list of trusted parameters through.
  def assignment_params
    params.require(:assignment).permit(:request_id, :driver_id, :driver_notes)
  end
end
