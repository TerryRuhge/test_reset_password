# frozen_string_literal: true

# location: spec/unit/rider_unit_spec.rb
require 'rails_helper'

RSpec.describe Rider, type: :model do
  subject do
    described_class.create(rider_id: 1, first_name: 'Ricardo', last_name: 'Martinez', phone_number: '2105270414',
                           local_address: '<address>')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a first name' do
    subject.first_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a last name' do
    subject.last_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a phone number' do
    subject.phone_number = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a local address' do
    subject.local_address = nil
    expect(subject).not_to be_valid
  end
end
