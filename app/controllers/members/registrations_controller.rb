# frozen_string_literal: true

module Members
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # def create
    #   super
    # end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # Do not display current password if they've signed in with oAuth for the first time.
    def update_resource(resource, params)
      if (resource.provider == 'google_oauth2') && !resource.created_password
        params.delete('current_password')
        resource.password = params['password']
        resource.created_password = true
        resource.update_without_password(params)
      else
        # Otherwise update with current password
        resource.update_with_password(params)
      end
    end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name address phone emergency_1_full_name emergency_1_phone_number])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name address phone emergency_1_full_name emergency_1_phone_number emergency_2_full_name emergency_2_phone_number drivers_license_number state_issue_lciense current_license date_of_birth parent_number parent_street_address parent_city parent_state parent_zip tshirt_size has_insurance allergies special_dietary_needs semesters_as_member college_major])
    end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   if current_member.present?
    #     edit_member_registration_path
    #   end
    #     super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
