# frozen_string_literal: true

# location: spec/unit/registration_unit_spec.rb
require 'rails_helper'

RSpec.describe Whitelist, type: :model do
  subject do
    described_class.create(email: 'adjdhflkajhsd@gjalsdm.com')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end
end
