# frozen_string_literal: true

class Assignment < ApplicationRecord
  belongs_to :request
  has_one :car

  validates :request_id, :car_id, presence: true
end
