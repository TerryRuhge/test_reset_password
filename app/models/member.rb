# frozen_string_literal: true

class Member < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
		 
  # validates :username, presence: true
  # validates :password, presence: true
  # validates_confirmation_of :password
  # validates :emergency_full_name, presence: true
  # validates :emergency_phone_number, presence: true
  # validates :address, presence: true
  # validates :phone, presence: true
  # validates :is_male, presence: true
  # validates :first_name, presence: true
  #validates :last_name, :first_name, :is_male, :phone, :address, :emergency_full_name, :emergency_phone_number, presence: true, on: [:update]
  validates :last_name, :first_name, :phone, :address, :emergency_full_name, :emergency_phone_number, presence: true, if: :valid_non_provider?

  def valid_non_provider?
    return self.provider.nil?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
      member.email = auth.info.email
      member.password = Devise.friendly_token[0, 20]
      member.full_name = auth.info.name 
      member.avatar_url = auth.info.image
      member.created_password = false
    end
  end
end
