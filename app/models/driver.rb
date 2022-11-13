# frozen_string_literal: true

class Driver < ApplicationRecord
  belongs_to :member

  has_one :cars, foreign_key: 'car_id'

  validates :member_id, :car_id, presence: true
end