# frozen_string_literal: true

require 'date'

module RequestsHelper
  # finds the time waited between the creation of the request and now (in minutes)
  def time_waited(request)
    ((DateTime.now - request.created_at.to_datetime) * 24 * 60).to_i
  end
end
