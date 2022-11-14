# frozen_string_literal: true

json.extract! car, :id, :make, :model, :color, :plate_number, :registration_expiry, :created_at, :updated_at
json.url car_url(car, format: :json)
