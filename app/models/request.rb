# frozen_string_literal: true

class Request < ApplicationRecord
	has_many :assignment
	
	validates :rider_id, :date_time, :pick_up_loc, :drop_off_loc, :num_passengers, presence: true
end
