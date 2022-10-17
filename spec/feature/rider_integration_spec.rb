# location: spec/feature/rider_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a rider autofill', type: :feature do
  scenario 'valid inputs' do
    visit new_rider_path
    fill_in 'First name', with: 'Ricardo'
    fill_in 'Last name', with: 'Martinez'
    fill_in 'Phone number', with: '2105270414'
	fill_in 'Local address', with: '719 S Rosemary Dr, Bryan, TX 77802'
    click_on 'Create Rider'
    visit riders_path
    expect(page).to have_content('Ricardo')
	expect(page).to have_content('Martinez')
	expect(page).to have_content('2105270414')
	expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
  end
end

RSpec.describe 'Showing a rider autofill', type: :feature do
  scenario 'show inputs' do
    visit new_rider_path
    fill_in 'First name', with: 'Ricardo'
    fill_in 'Last name', with: 'Martinez'
    fill_in 'Phone number', with: '2105270414'
	fill_in 'Local address', with: '719 S Rosemary Dr, Bryan, TX 77802'
    click_on 'Create Rider'
	visit rider_path(Rider.find_by_phone_number('2105270414'))
	expect(page).to have_content('Ricardo')
	expect(page).to have_content('Martinez')
	expect(page).to have_content('2105270414')
	expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
  end
end

RSpec.describe 'Updating a rider autofill', type: :feature do
  scenario 'update inputs' do
    visit new_rider_path
    fill_in 'First name', with: 'Ricardo'
    fill_in 'Last name', with: 'Martinez'
    fill_in 'Phone number', with: '2105270414'
	fill_in 'Local address', with: '719 S Rosemary Dr, Bryan, TX 77802'
    click_on 'Create Rider'
	visit edit_rider_path(Rider.find_by_phone_number('2105270414'))
	fill_in 'Local address', with: '676 Lubbock St, College Station, TX 77840'
	click_on 'Update Rider'
	visit riders_path
    expect(page).to have_content('Ricardo')
	expect(page).to have_content('Martinez')
	expect(page).to have_content('2105270414')
	expect(page).to have_content('676 Lubbock St, College Station, TX 77840')
  end
end

RSpec.describe 'Deleting a rider autofill', type: :feature do
  scenario 'delete inputs' do
    visit new_rider_path
    fill_in 'First name', with: 'Ricardo'
    fill_in 'Last name', with: 'Martinez'
    fill_in 'Phone number', with: '2105270414'
	fill_in 'Local address', with: '719 S Rosemary Dr, Bryan, TX 77802'
    click_on 'Create Rider'
	visit riders_path
	expect(page).to have_content('Ricardo')
	expect(page).to have_content('Martinez')
	expect(page).to have_content('2105270414')
	expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
	click_link 'Destroy'
    expect(page).not_to have_content('Ricardo')
	expect(page).not_to have_content('Martinez')
	expect(page).not_to have_content('2105270414')
	expect(page).not_to have_content('719 S Rosemary Dr, Bryan, TX 77802')
  end
end