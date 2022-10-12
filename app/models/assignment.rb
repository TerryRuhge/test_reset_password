class Assignment < ApplicationRecord
	belongs_to :request
	
	validates :request_id, :driver_id, presence: true
end
