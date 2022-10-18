# frozen_string_literal: true

class MemberController < ApplicationController
  def index; end

  def rider_info
    @assigned_rides = Assignment.where(driver_id: @driver).where.not(queue_pos: '0').order('request_id ASC')
    return unless @assigned_rides

    format.html { render :edit, notice: 'No assigned Riders' }
    format.json { render json: @assignment.errors, status: :unprocessable_entity }
  end

  helper_method :rider_info
end
