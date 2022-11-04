# frozen_string_literal: true

# location: spec/feature/assignment_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an assignment', type: :feature do
  scenario 'valid inputs' do
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    click_on 'Assign'
    fill_in 'Car:', with: 7
    click_on 'Create Assignment'
    visit assignments_riding_path
    expect(page).to have_content('7')
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('3')
  end
end

RSpec.describe 'Updating an assignment', type: :feature do
  scenario 'update inputs' do
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    click_on 'Assign'
    fill_in 'Car:', with: 7
    click_on 'Create Assignment'
    visit edit_assignment_path(Assignment.find_by_request_id(Request.find_by_phone_number('2105270414')))
    fill_in 'Car:', with: 9
    click_on 'Update Assignment'
    visit assignments_riding_path
    expect(page).to have_content('9')
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('3')
  end
end

RSpec.describe 'Marking an assignment as Done', type: :feature do
  scenario 'change status' do
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    click_on 'Assign'
    fill_in 'Car:', with: 7
    click_on 'Create Assignment'
    visit assignments_riding_path
    click_on 'Done'
    visit assignments_done_path
    expect(page).to have_content('Done')
    expect(page).to have_content('7')
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
  end
end

RSpec.describe 'Driver notes of an assignment', type: :feature do
  scenario 'driver notes' do
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    click_on 'Assign'
    fill_in 'Car:', with: 7
    click_on 'Create Assignment'
    visit assignment_notes_path(Assignment.find_by_request_id(Request.find_by_phone_number('2105270414')))
    fill_in 'Notes', with: 'Everything went smoothly.'
    click_on 'Update Assignment'
    visit assignments_riding_path
    click_on 'Done'
    visit assignments_done_path
    expect(page).to have_content('Done')
    expect(page).to have_content('7')
    expect(page).to have_content('Everything went smoothly.')
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
  end
end

RSpec.describe 'Deleting an assignment', type: :feature do
  scenario 'delete inputs' do
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    click_on 'Assign'
    fill_in 'Car:', with: 7
    click_on 'Create Assignment'
    visit assignments_riding_path
    expect(page).to have_content('7')
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    visit assignments_path
    click_on 'Destroy'
    visit assignments_riding_path
    expect(page).not_to have_content('7')
    expect(page).not_to have_content('Ricardo')
    expect(page).not_to have_content('2105270414')
    expect(page).not_to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).not_to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).not_to have_content('3')
  end
end
