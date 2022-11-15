# frozen_string_literal: true

# location: spec/unit/ndr_unit_spec.rb
# require 'rails_helper'
#
# RSpec.describe Ndr, type: :model do
#  subject do
#    described_class.create(is_active: false, member_id: 1, start_time: '2022-11-14 01:00', end_time: '2022-11-14 23:00', members_needed: true, num_members_desired: 5)
#  end
#
#  it 'is valid with valid attributes' do
#    expect(subject).to be_valid
#  end
#
#  it 'is not valid without active status' do
#    subject.is_active = nil
#    expect(subject).not_to be_valid
#  end
#
#  it 'is not valid without a member id' do
#    subject.member_id = nil
#    expect(subject).not_to be_valid
#  end
#
#  it 'is not valid without a start time' do
#    subject.start_time = nil
#    expect(subject).not_to be_valid
#  end
#
#  it 'is not valid without a end time' do
#    subject.end_time = nil
#    expect(subject).not_to be_valid
#  end
#
#  it 'is not valid without members needed' do
#    subject.members_needed = nil
#    expect(subject).not_to be_valid
#  end
#
#  it 'is not valid without the number of members desired' do
#    subject.num_members_desired = nil
#    expect(subject).not_to be_valid
#  end
# end
