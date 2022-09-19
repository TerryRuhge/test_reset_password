class CarRide < ApplicationRecord
	validates :request_id, presence: true
	validates :driver_id, presence: true
end
