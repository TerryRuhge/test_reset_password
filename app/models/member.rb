# frozen_string_literal: true

class Member < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  validates :emergency_contact_id, presence: true
end
