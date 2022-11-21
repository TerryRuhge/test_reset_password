# frozen_string_literal: true

# location: spec/unit/registration_unit_spec.rb
require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) { Member.create!(first_name: 'TestName', last_name: 'TestName', phone: '8324616853', address: '987239yr8', emergency_phone_number: '8578575843', emergency_full_name: 'TestName', email: 'adjdhflkajhsd@gjalsdm.com', password: '123456', password_confirmation: '123456') }
  # before :each do
  #     sign_in member
  # end
  #   subject do
  #     Member.create!(first_name: 'TestName', last_name: 'TestName', phone: '8324616853', address: '987239yr8', emergency_full_name: 'TestName', emergency_full_name: '987346823476587264', email: 'adjdhflkajhsd@gjalsdm.com', password: '123456', password_confirmation: '123456')
  #     #described_class.create(request_id: 1, driver_id: 1)
  #   end

  # it 'is valid with valid attributes' do
  #   expect(member).to be_valid
  # end

  # it 'is not valid without a first_name' do
  #   member.first_name = nil
  #   expect(member).not_to be_valid
  # end

  it 'is not valid without a driver' do
    subject.last_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a driver' do
    subject.phone = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a driver' do
    subject.address = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a driver' do
    subject.emergency_full_name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a driver' do
    subject.emergency_phone_number = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a driver' do
    subject.password = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a driver' do
    subject.password_confirmation = nil
    expect(subject).not_to be_valid
  end
end
