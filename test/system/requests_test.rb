# frozen_string_literal: true

require 'application_system_test_case'

class RequestsTest < ApplicationSystemTestCase
  setup do
    @request = requests(:one)
  end

  test 'visiting the index' do
    visit requests_url
    assert_selector 'h1', text: 'Requests'
  end

  test 'creating a Request' do
    visit requests_url
    click_on 'New Request'

    fill_in 'Additional info', with: @request.additional_info
    fill_in 'Attire', with: @request.attire
    fill_in 'Date', with: @request.date
    fill_in 'Drop off loc', with: @request.drop_off_loc
    fill_in 'Num passengers', with: @request.num_passengers
    fill_in 'Pick up loc', with: @request.pick_up_loc
    fill_in 'Request', with: @request.request_id
    fill_in 'Rider', with: @request.rider_id
    click_on 'Create Request'

    assert_text 'Request was successfully created'
    click_on 'Back'
  end

  test 'updating a Request' do
    visit requests_url
    click_on 'Edit', match: :first

    fill_in 'Additional info', with: @request.additional_info
    fill_in 'Attire', with: @request.attire
    fill_in 'Date', with: @request.date
    fill_in 'Drop off loc', with: @request.drop_off_loc
    fill_in 'Num passengers', with: @request.num_passengers
    fill_in 'Pick up loc', with: @request.pick_up_loc
    fill_in 'Request', with: @request.request_id
    fill_in 'Rider', with: @request.rider_id
    click_on 'Update Request'

    assert_text 'Request was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Request' do
    visit requests_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Request was successfully destroyed'
  end
end
