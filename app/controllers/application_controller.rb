# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # / Home -> landing when site is accessed
  def show; end

  private
    #Redirect to Edit Account if signed in without making password.
    def authenticate_member_setup!
      if member_signed_in?
        if !current_member.created_password or current_member.first_name.blank? or current_member.last_name.blank? or current_member.address.blank? or current_member.emergency_full_name.blank? or current_member.emergency_phone_number.blank?
          redirect_to edit_member_registration_path, :alert => "Please fill out the remainder of your account."
        end
      end
    end

end
