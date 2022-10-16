# location: spec/feature/registration_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Signing up with Form', type: :feature do
    scenario 'valid inputs' do
        visit new_registration_path
        fill_in 'first_name', with: 'Jilly'
        fill_in 'last_name', with: 'Phol'
        fill_in 'email', with: 'gipahe6735@imdutex.com'
        fill_in 'address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
        fill_in 'phone', with: '3343987387'
        select 'gender', with: true
        fill_in 'emergency_full_name', with: 'John Phol'
        fill_in 'emergency_phone_number', with: '3343962503'
        fill_in 'password', with '123456'
        fill_in 'password_confirmation', with '123456'
        click_on 'Sign up'
        visit root
        expect(page).to have_content('gipahe6735@imdutex.com')
    end
    scenario 'invalid password confirmation' do
        visit new_registration_path
        fill_in 'first_name', with: 'Jilly'
        fill_in 'last_name', with: 'Phol'
        fill_in 'email', with: 'gipahe67764@imdutex.com'
        fill_in 'address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
        fill_in 'phone', with: '3343987387'
        select 'gender', with: true
        fill_in 'emergency_full_name', with: 'John Phol'
        fill_in 'emergency_phone_number', with: '3343962503'
        fill_in 'password', with '123456'
        fill_in 'password_confirmation', with '12345'
        click_on 'Sign up'
        expect(page).to have_content("Password confirmation doesn't match Password")
    end
    scenario 'Missing Field' do
        fill_in 'email', with: 'gipafsfg67764@imdutex.com'
        fill_in 'address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
        fill_in 'phone', with: '3343987387'
        select 'gender', with: true
        fill_in 'password', with '123456'
        fill_in 'password_confirmation', with '12345'
        click_on 'Sign up'
        expect(page).to have_content("can't be blank")
    end
    scenario 'Email already taken' do
        visit new_registration_path
        fill_in 'first_name', with: 'Jilly'
        fill_in 'last_name', with: 'Phol'
        fill_in 'email', with: 'gipahe6735@imdutex.com'
        fill_in 'address', with: '2769 Eastern Blvd Montgomery, Alaska 36117'
        fill_in 'phone', with: '3343987387'
        select 'gender', with: true
        fill_in 'emergency_full_name', with: 'John Phol'
        fill_in 'emergency_phone_number', with: '3343962503'
        fill_in 'password', with '123456'
        fill_in 'password_confirmation', with '123456'
        click_on 'Sign up'
        visit root
        expect(page).to have_content('Email has already been taken')
    end
end

RSpec.describe 'Signing up with Google', type: :feature do
    scenario 'valid input' do
        visit new_registration_path
        click_on 'Sign in with Google'
        expect(page).to have_content('Edit')
    end
end