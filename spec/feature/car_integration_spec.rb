# frozen_string_literal: true

# location: spec/feature/car_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a car', type: :feature do
  scenario 'valid inputs' do
    visit new_car_path
    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Camry'
    fill_in 'Color', with: 'Red'
    fill_in 'Plate number', with: 'PZ65 BYV'
    click_on 'Create Car'
    visit cars_path
    expect(page).to have_content('Toyota')
    expect(page).to have_content('Camry')
    expect(page).to have_content('Red')
    expect(page).to have_content('PZ65 BYV')
  end
end

RSpec.describe 'Updating a car', type: :feature do
  scenario 'update inputs' do
    visit new_car_path
    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Camry'
    fill_in 'Color', with: 'Red'
    fill_in 'Plate number', with: 'PZ65 BYV'
    click_on 'Create Car'
    visit edit_car_path(Car.find_by_make('Toyota'))
    fill_in 'Plate number', with: 'PZ6S BYX'
    click_on 'Update Car'
    visit cars_path
    expect(page).to have_content('Toyota')
    expect(page).to have_content('Camry')
    expect(page).to have_content('Red')
    expect(page).to have_content('PZ6S BYX')
  end
end

RSpec.describe 'Deleting a car', type: :feature do
  scenario 'delete inputs' do
    visit new_car_path
    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Camry'
    fill_in 'Color', with: 'Red'
    fill_in 'Plate number', with: 'PZ65 BYV'
    click_on 'Create Car'
    visit cars_path
    expect(page).to have_content('Toyota')
    expect(page).to have_content('Camry')
    expect(page).to have_content('Red')
    expect(page).to have_content('PZ65 BYV')
    click_on 'Delete'
    expect(page).not_to have_content('Toyota')
    expect(page).not_to have_content('Camry')
    expect(page).not_to have_content('Red')
    expect(page).not_to have_content('PZ65 BYV')
  end
end
