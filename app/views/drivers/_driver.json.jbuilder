# frozen_string_literal: true

json.extract! driver, :id, :created_at, :updated_at
json.url driver_url(driver, format: :json)
