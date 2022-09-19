class Rider < ApplicationRecord
	validates :phone_number, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :local_address, presence: true
	validates :emergency_contact_id, presence: true
end
