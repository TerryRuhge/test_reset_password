# location: spec/feature/request_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a request', type: :feature do
  scenario 'valid inputs' do
    visit new_rider_path
    fill_in 'First name', with: 'Ricardo'
    fill_in 'Last name', with: 'Martinez'
    fill_in 'Phone number', with: '2105270414'
	fill_in 'Local address', with: '719 S Rosemary Dr, Bryan, TX 77802'
    click_on 'Create Rider'
    visit new_request_path
    select('Martinez, Ricardo', from: 'request_rider_id')
    fill_in 'Pick up loc', with: '125 Spence Str, College Station, TX 77840'
	fill_in 'Num passengers', with: 3
    click_on 'SUBMIT'
    visit requests_path
	expect(page).to have_content('Martinez, Ricardo')
    expect(page).to have_content('Unassigned')
	expect(page).to have_content('125 Spence Str, College Station, TX 77840')
	expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
	expect(page).to have_content('3')
  end
end

RSpec.describe 'Showing a request', type: :feature do
  scenario 'show inputs' do
    visit new_rider_path
    fill_in 'First name', with: 'Ricardo'
    fill_in 'Last name', with: 'Martinez'
    fill_in 'Phone number', with: '2105270414'
	fill_in 'Local address', with: '719 S Rosemary Dr, Bryan, TX 77802'
    click_on 'Create Rider'
    visit new_request_path
    select('Martinez, Ricardo', from: 'request_rider_id')
    fill_in 'Pick up loc', with: '125 Spence Str, College Station, TX 77840'
	fill_in 'Num passengers', with: 3
    click_on 'SUBMIT'
	visit request_path(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')))
	expect(page).to have_content('Martinez, Ricardo')
	expect(page).to have_content('Unassigned')
	expect(page).to have_content('125 Spence Str, College Station, TX 77840')
	expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
	expect(page).to have_content('3')
  end
end

RSpec.describe 'Updating a request', type: :feature do
  scenario 'update inputs' do
    visit new_rider_path
    fill_in 'First name', with: 'Ricardo'
    fill_in 'Last name', with: 'Martinez'
    fill_in 'Phone number', with: '2105270414'
	fill_in 'Local address', with: '719 S Rosemary Dr, Bryan, TX 77802'
    click_on 'Create Rider'
    visit new_request_path
    select('Martinez, Ricardo', from: 'request_rider_id')
    fill_in 'Pick up loc', with: '125 Spence Str, College Station, TX 77840'
	fill_in 'Num passengers', with: 3
    click_on 'SUBMIT'
	visit edit_request_path(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')))
	fill_in 'Pick up loc', with: '676 Lubbock St, College Station, TX 77840'
	fill_in 'Num passengers', with: 2
	click_on 'SUBMIT'
	visit requests_path
	expect(page).to have_content('Martinez, Ricardo')
    expect(page).to have_content('Unassigned')
	expect(page).to have_content('676 Lubbock St, College Station, TX 77840')
	expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
	expect(page).to have_content('2')
  end
end

RSpec.describe 'Canceling a request', type: :feature do
  scenario 'cancel inputs' do
    visit new_rider_path
    fill_in 'First name', with: 'Ricardo'
    fill_in 'Last name', with: 'Martinez'
    fill_in 'Phone number', with: '2105270414'
	fill_in 'Local address', with: '719 S Rosemary Dr, Bryan, TX 77802'
    click_on 'Create Rider'
    visit new_request_path
    select('Martinez, Ricardo', from: 'request_rider_id')
    fill_in 'Pick up loc', with: '125 Spence Str, College Station, TX 77840'
	fill_in 'Num passengers', with: 3
    click_on 'SUBMIT'
	visit requests_path
	expect(page).to have_content('Martinez, Ricardo')
    expect(page).to have_content('Unassigned')
	expect(page).to have_content('125 Spence Str, College Station, TX 77840')
	expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
	expect(page).to have_content('3')
	click_link 'Cancel'
	expect(page).not_to have_content('Unassigned')
	expect(page).to have_content('Cancelled')
  end
end

RSpec.describe 'Deleting a request', type: :feature do
  scenario 'delete inputs' do
    visit new_rider_path
    fill_in 'First name', with: 'Ricardo'
    fill_in 'Last name', with: 'Martinez'
    fill_in 'Phone number', with: '2105270414'
	fill_in 'Local address', with: '719 S Rosemary Dr, Bryan, TX 77802'
    click_on 'Create Rider'
    visit new_request_path
    select('Martinez, Ricardo', from: 'request_rider_id')
    fill_in 'Pick up loc', with: '125 Spence Str, College Station, TX 77840'
	fill_in 'Num passengers', with: 3
    click_on 'SUBMIT'
	visit requests_path
	expect(page).to have_content('Martinez, Ricardo')
	expect(page).to have_content('Unassigned')
	expect(page).to have_content('125 Spence Str, College Station, TX 77840')
	expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
	expect(page).to have_content('3')
	click_link 'Destroy'
	expect(page).not_to have_content('Martinez, Ricardo')
    expect(page).not_to have_content('Unassigned')
	expect(page).not_to have_content('125 Spence Str, College Station, TX 77840')
	expect(page).not_to have_content('719 S Rosemary Dr, Bryan, TX 77802')
	expect(page).not_to have_content('3')
  end
end