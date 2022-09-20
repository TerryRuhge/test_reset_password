# frozen_string_literal: true

class Request < ApplicationRecord
  validates :rider_id, presence: true
  validates :date, presence: true
  validates :pick_up_loc, presence: true
  validates :drop_off_loc, presence: true
  validates :num_passengers, presence: true
  validates :attire, presence: true
end
