# frozen_string_literal: true

# location: spec/feature/request_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a request', type: :feature do
  scenario 'valid inputs' do
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('3')
  end
end

RSpec.describe 'Updating a request', type: :feature do
  scenario 'update inputs' do
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit edit_request_path(Request.find_by_phone_number('2105270414'))
    fill_in 'Pick Up Location:', with: '676 Lubbock St, College Station, TX 77840'
    fill_in 'Number of Passengers:', with: 2
    click_on 'Update Request'
    visit requests_waiting_path
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('676 Lubbock St, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('2')
  end
end

RSpec.describe 'Canceling a request', type: :feature do
  scenario 'cancel inputs' do
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('3')
    click_on 'Cancel'
    visit assignments_done_path
    expect(page).to have_content('Cancelled')
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('Cancelled')
  end
end

RSpec.describe 'Deleting a request', type: :feature do
  scenario 'delete inputs' do
    visit requests_incoming_path
    fill_in 'Name:', with: 'Ricardo'
    fill_in 'Phone Number:', with: '2105270414'
    fill_in 'Pick Up Location:', with: '125 Spence Str, College Station, TX 77840'
    fill_in 'Drop Off Location:', with: '719 S Rosemary Dr, Bryan, TX 77802'
    fill_in 'Number of Passengers:', with: 3
    click_on 'Create Request'
    visit requests_waiting_path
    expect(page).to have_content('Ricardo')
    expect(page).to have_content('2105270414')
    expect(page).to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).to have_content('3')
    visit requests_path
    click_on 'Destroy'
    expect(page).not_to have_content('Ricardo')
    expect(page).not_to have_content('2105270414')
    expect(page).not_to have_content('125 Spence Str, College Station, TX 77840')
    expect(page).not_to have_content('719 S Rosemary Dr, Bryan, TX 77802')
    expect(page).not_to have_content('3')
  end
end
