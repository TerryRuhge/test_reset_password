class Car < ApplicationRecord
    has_one :assignment
    has_and_belongs_to_many :drivers

    validates :make, presence: true
    validates :model, presence: true
    validates :color, presence: true
    validates :plate_number, presence: true
    validates :registration_expiry, presence: true

    # make sure the plate number is created as uppercase
    def plate_number=(value)
        write_attribute :plate_number, value.upcase
    end
end
