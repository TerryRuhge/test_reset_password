# location: spec/unit/assignment_unit_spec.rb
require 'rails_helper'

RSpec.describe Assignment, type: :model do
  subject do
    Rider.create(rider_id: 1, first_name: "Ricardo", last_name: "Martinez", phone_number: "2105270414", local_address: "<address>")
    Request.create(request_id: 1, rider_id: 1, date_time: '2022-09-18 22:26:00', pick_up_loc: '<address>', num_passengers: 1)
    described_class.create(request_id: 1, driver_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a request' do
    subject.request_id = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a driver' do
    subject.driver_id = nil
    expect(subject).not_to be_valid
  end
end