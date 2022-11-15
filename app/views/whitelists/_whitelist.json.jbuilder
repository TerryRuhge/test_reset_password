# frozen_string_literal: true

json.extract! whitelist, :id, :email, :created_at, :updated_at
json.url whitelist_url(whitelist, format: :json)
