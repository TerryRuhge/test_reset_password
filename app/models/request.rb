# frozen_string_literal: true

class Request < ApplicationRecord
  has_many :assignment

  validates :name, :phone_number, :pick_up_loc, :drop_off_loc, :num_passengers, presence: true

  # phone numbers organized by NPA-NXX-XXXX (assumed NA only)
  # NPA is area code (201-999)
  # NXX goes from 200-999
  # XXXX goes from 0000-9999
  # regex pulled from https://rubygems.org/gems/phone_number_validator documentation
  validates :phone_number, phone_number: { format: /^(?:(?:[2-9]11)|(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:\x20+|#|x\.?|ext\.?|extension)\s*(\d+))?)$/i }
  
  def self.waiting
    return Request.where(request_status: 'Unassigned').count
  end
  
  def self.riding
    return Request.where(request_status: 'Assigned Driver').count
  end
  
  def self.done
    return Request.where(request_status: 'Done').count
  end
  
  def self.missed
    return Request.where(request_status: 'Missed').count
  end
  
  def self.cancelled
    return Request.where(request_status: 'Cancelled').count
  end
end
