class Rider < ApplicationRecord
	def self.search(search_first_name, search_last_name, search_phone_number)
		if search_first_name && search_last_name && search_phone_number
			rider_exist = Rider.find_by(first_name: search_first_name, last_name: search_last_name, phone_number: search_phone_number)
			if rider_exist
				self.where(rider_id: rider)
			else
				Rider.all
			end
		else
			Rider.all
		end
	end
end
