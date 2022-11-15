# frozen_string_literal: true

json.extract! ndr, :id, :start_time, :end_time, :ndr_id, :created_at, :updated_at
json.url ndr_url(ndr, format: :json)
