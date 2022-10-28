# frozen_string_literal: true
# location: spec/feature/registration_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Signing up with Form', type: :system do
    let(:email) {Faker::Internet.email}
    let(:password) {Faker::Internet.password(min_length: 6)}
    before do
        visit new_member_registration_path
    end

    scenario 'valid inputs' do
        fill_in 'member_first_name', with: "Test"
        fill_in 'member_last_name', with: 'Phol'
        fill_in 'member_email', with: email
        fill_in 'member_address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
        fill_in 'member_phone', with: '3343987387'
        fill_in 'member_emergency_full_name', with: 'John Phol'
        fill_in 'member_emergency_phone_number', with: '5656354563'
        fill_in 'member_password', with: password
        fill_in 'member_password_confirmation', with: password
        click_on 'Sign up'

        expect(page).to have_content(email)
    end
    scenario 'invalid password confirmation' do
        fill_in 'member_first_name', with: 'Jilly'
        fill_in 'member_last_name', with: 'Phol'
        fill_in 'member_email', with: 'gipahe67764@imdutex.com'
        fill_in 'member_address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
        fill_in 'member_phone', with: '3343987387'
        fill_in 'member_emergency_full_name', with: 'John Phol'
        fill_in 'member_emergency_phone_number', with: '3343962503'
        fill_in 'member_password', with: '123456'
        fill_in 'member_password_confirmation', with: '12345'
        click_on 'Sign up'
        expect(page).to have_content("Password confirmation doesn't match Password")
    end
    scenario 'Missing Field' do
        fill_in 'member_email', with: 'gipafsfg67764@imdutex.com'
        fill_in 'member_address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
        fill_in 'member_phone', with: '3343987387'
        fill_in 'member_password', with: '123456'
        fill_in 'member_password_confirmation', with: '12345'
        click_on 'Sign up'
        expect(page).to have_content("can't be blank")
    end
    scenario 'Email already taken' do
        fill_in 'member_first_name', with: 'Jilly'
        fill_in 'member_last_name', with: 'Phol'
        fill_in 'member_email', with: 'gipafsfg67764@imdutex.com'
        fill_in 'member_address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
        fill_in 'member_phone', with: '3343987387'
        fill_in 'member_emergency_full_name', with: 'John Phol'
        fill_in 'member_emergency_phone_number', with: '3343962503'
        fill_in 'member_password', with: '123456'
        fill_in 'member_password_confirmation', with: '123456'
        click_on 'Sign up'
        expect(page).to have_content('Email has already been taken')
    end
end

# RSpec.describe 'Signing up with Google', type: :feature do
#     scenario 'valid input' do
#         visit new_registration_path
#         click_on 'Sign in with Google'
#         expect(page).to have_content('Edit')
#     end
# end
