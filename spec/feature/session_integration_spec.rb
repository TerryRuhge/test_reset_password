# frozen_string_literal: true
# # # location: spec/feature/session_integration_spec.rb
# require 'rails_helper'

# # RSpec.describe 'Signing up with Form', type: :system do
# #     before do
# #         member = FactoryBot.create(:member)
# #         #member.confirmed_at = Time.now
# #         sign_in member
# #     end

# #     scenario "homepage" do
# #         visit root_path
# #         expect(response).not_to have_http_status(:redirect)
# #     end
# # end
# RSpec.describe 'Signing in with Form', type: :system do
#     # before do
#     #     @member1 = create :member
#     #     visit new_member_registration_path
#     # end

#     scenario "valid with correct credentials" do
#         visit new_member_session_path
#         fill_in "email", with: "Test@gmail.com"
#         fill_in "password", with: "123456"
#         click_button "sign_in"

#         expect(page).to have_text "Test@gmail.com"
#     end
# end
