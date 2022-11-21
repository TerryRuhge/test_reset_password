# frozen_string_literal: true

class MemberController < ApplicationController
  before_action :set_driver, only: %i[show edit update destroy]

  def index; end

  def no_ride_assigned; end
  
  def rider_info
    @assigned_rides = Assignment.where(member_id: current_member.member_id, drop_off_time: nil)
    if @assigned_rides.empty?
      redirect_to no_ride_assigned_path
    end
    @assigned_rides.each do |ride|
      @ride_info = Request.where(request_id:ride.request_id)
    end

  end

  

  def all_statuses; end
end
