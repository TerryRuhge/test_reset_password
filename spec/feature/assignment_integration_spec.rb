# location: spec/feature/assignment_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an assignment', type: :feature do
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
	visit new_assignment_path
	select(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')).request_id, from: 'assignment_request_id')
    fill_in 'Driver', with: 7
    click_on 'Create Assignment'
    visit assignments_path
    expect(page).to have_content('In Progress')
	expect(page).to have_content('7')
  end
end

RSpec.describe 'Showing an assignment', type: :feature do
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
	visit new_assignment_path
	select(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')).request_id, from: 'assignment_request_id')
    fill_in 'Driver', with: 7
    click_on 'Create Assignment'
    visit assignment_path(Assignment.find_by_request_id(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414'))))
    expect(page).to have_content('In Progress')
	expect(page).to have_content('7')
  end
end

RSpec.describe 'Updating an assignment', type: :feature do
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
	visit new_assignment_path
	select(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')).request_id, from: 'assignment_request_id')
    fill_in 'Driver', with: 7
    click_on 'Create Assignment'
    visit edit_assignment_path(Assignment.find_by_request_id(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414'))))
	fill_in 'Driver', with: 9
	click_on 'Update Assignment'
	visit assignments_path
    expect(page).to have_content('In Progress')
	expect(page).to have_content('9')
  end
end

RSpec.describe 'Changing status of an assignment', type: :feature do
  scenario 'change status' do
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
	visit new_assignment_path
	select(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')).request_id, from: 'assignment_request_id')
    fill_in 'Driver', with: 7
    click_on 'Create Assignment'
    visit request_status_path(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')))
	select('Finished', from: 'request_request_status')
	click_on 'SUBMIT'
	visit assignments_path
    expect(page).to have_content('Finished')
	expect(page).to have_content('7')
  end
end

RSpec.describe 'Driver notes of an assignment', type: :feature do
  scenario 'driver notes' do
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
	visit new_assignment_path
	select(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')).request_id, from: 'assignment_request_id')
    fill_in 'Driver', with: 7
    click_on 'Create Assignment'
    visit request_status_path(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')))
	select('Finished', from: 'request_request_status')
	click_on 'SUBMIT'
	visit assignment_notes_path(Assignment.find_by_request_id(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')).request_id))
	fill_in 'Driver notes', with: 'Everything went smoothly.'
	click_on 'Update Assignment'
	visit assignment_path(Assignment.find_by_request_id(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414'))))
    expect(page).to have_content('Finished')
	expect(page).to have_content('7')
	expect(page).to have_content('Everything went smoothly.')
  end
end

RSpec.describe 'Deleting an assignment', type: :feature do
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
	visit new_assignment_path
	select(Request.find_by_rider_id(Rider.find_by_phone_number('2105270414')).request_id, from: 'assignment_request_id')
    fill_in 'Driver', with: 7
    click_on 'Create Assignment'
    visit assignments_path
	expect(page).to have_content('In Progress')
	expect(page).to have_content('7')
	click_link 'Destroy'
	expect(page).not_to have_content('In Progress')
	expect(page).not_to have_content('7')
  end
end