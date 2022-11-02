# frozen_string_literal: true

class Driver < ApplicationRecord
    belongs_to :member

    validates :member_id, :car_id, presence: true

end
