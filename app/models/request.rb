# frozen_string_literal: true

class Request < ApplicationRecord
	belongs_to :rider
	has_many :assignment
	
	validates :rider_id, :date_time, :pick_up_loc, :num_passengers, presence: true
end
