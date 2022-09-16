json.extract! request, :id, :request_id, :rider_id, :date, :pick_up_loc, :drop_off_loc, :num_passengers, :attire, :additional_info, :created_at, :updated_at
json.url request_url(request, format: :json)
