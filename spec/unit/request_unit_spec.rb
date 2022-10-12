# location: spec/unit/request_unit_spec.rb
require 'rails_helper'

RSpec.describe Request, type: :model do
  subject do
    described_class.create(rider_id: 1, date_time: '2022-09-18 22:26:00', pick_up_loc: '<address>', drop_off_loc: '<address>', num_passengers: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a rider' do
    subject.rider_id = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a date and time' do
    subject.date_time = nil
    expect(subject).not_to be_valid
  end
  
  it 'is not valid without a pick up location' do
    subject.pick_up_loc = nil
    expect(subject).not_to be_valid
  end
  
  it 'is not valid without a drop off location' do
    subject.drop_off_loc = nil
    expect(subject).not_to be_valid
  end
  
  it 'is not valid without a number of passengers' do
    subject.num_passengers = nil
    expect(subject).not_to be_valid
  end
end