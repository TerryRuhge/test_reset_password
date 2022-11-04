# frozen_string_literal: true

module AssignmentsHelper
  # finds the time ridden (in minutes)
  def time_rode(assignment)
    # making sure pick up and drop off times were specified
    if assignment.drop_off_time and assignment.pick_up_time
      time = ((assignment.drop_off_time.to_datetime - assignment.pick_up_time.to_datetime) * 24 * 60).to_i.to_s + 'm'
    # otherwise default to ''
    else
	  time = ''
	end
	
    return time
  end
  
  # finds the time returned home (HH:MM)
  def time_home(assignment)
    # making sure drop off time was specified
    if assignment.drop_off_time
      time = assignment.drop_off_time.to_datetime.in_time_zone('America/Chicago').strftime('%H:%m')
    # otherwise default to 0
	else
	  time = ''
    end
    
    return time
  end
end
