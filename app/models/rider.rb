class Rider < ApplicationRecord
	has_many :request

	# search feature for riders based on first and last name
	def self.search(search_first_name, search_last_name)
		rider_exist = Rider.where(first_name: search_first_name, last_name: search_last_name)
		self.where(rider_id: rider_exist)
	end
end
