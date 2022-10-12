class Rider < ApplicationRecord
	def self.search(search_first_name, search_last_name)
		rider_exist = Rider.find_by(first_name: search_first_name, last_name: search_last_name)
		self.where(rider_id: rider_exist)
	end
end
