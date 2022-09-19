class Driver < ApplicationRecord
	validates :phone_number, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :car_model, presence: true
end
