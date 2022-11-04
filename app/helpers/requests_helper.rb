# frozen_string_literal: true

require 'date'

module RequestsHelper
  # finds the time duration between now and when request was created (in minutes)
  # used in RequestController for declaring Cancelled or Missed
  def time_dur(request)
    ((DateTime.now - request.created_at.to_datetime) * 24 * 60).to_i
  end

  # finds the time waited between the creation of the request and now (in minutes)
  def time_waiting(request)
    ((DateTime.now - request.created_at.to_datetime) * 24 * 60).to_i.to_s + 'm'
  end
  
  # finds the time waited between the creation of the request and assignment (in minutes)
  def time_diff(request, assignment)
    ((assignment.created_at.to_datetime - request.created_at.to_datetime) * 24 * 60).to_i.to_s + 'm'
  end

  # finds the time between creation of request and cancellation (in minutes)
  # this needs to be updated with a new request attribute to store time cancelled
  def time_cancelled(request)
    ((request.updated_at.to_datetime - request.created_at.to_datetime) * 24 * 60).to_i.to_s + 'm'
  end
end
