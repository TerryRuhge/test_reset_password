# # location: spec/feature/session_integration_spec.rb
# require 'rails_helper'

# RSpec.describe 'Signing in with Form', type: :system do
#     before do
#         @member1 = create :member
#         visit new_member_registration_path
#     end

#     scenario "valid with correct credentials" do
#         fill_in "email", with: @member1.email
#         fill_in "password", with: @member1.password
#         click_button "sign_in"

#         expect(page).to have_text @member1.email
#     end
# end