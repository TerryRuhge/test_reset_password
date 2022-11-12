# frozen_string_literal: true

class MemberController < ApplicationController
  before_action :set_driver, only: %i[show edit update destroy]

  def index; end

  def rider_info
    @assigned_rides = Assignment.where(member_id: @member).order('request_id ASC')
  end

  def all_statuses; end
  helper_method :rider_info
end
