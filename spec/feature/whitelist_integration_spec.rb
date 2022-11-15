# frozen_string_literal: true

# location: spec/feature/ndr_integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an whitelist', type: :feature do
  scenario 'valid inputs' do
    visit new_whitelist_path
    fill_in 'Email', with: 'reb_pendra@gmail.com'
	click_on 'Create Whitelist'
    visit whitelists_path
    expect(page).to have_content('reb_pendra@gmail.com')
  end
end

RSpec.describe 'Editing a whitelist', type: :feature do
  scenario 'update inputs' do
    visit new_whitelist_path
    fill_in 'Email', with: 'reb_pendra@gmail.com'
	click_on 'Create Whitelist'
    visit edit_whitelist_path(Whitelist.find_by_email('reb_pendra@gmail.com'))
    fill_in 'Email', with: 'reb_pendragon@gmail.com'
	click_on 'Update Whitelist'
    visit whitelists_path
    expect(page).to have_content('reb_pendragon@gmail.com')
  end
end

# unable to test removing a whitelist