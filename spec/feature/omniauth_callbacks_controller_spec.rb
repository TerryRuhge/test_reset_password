# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Members::OmniauthCallbacksController, type: :controller do
  before(:each) do
    # @controller = omniauth_callbacks_controller.new
    request.env['devise.mapping'] = Devise.mappings[:member]
  end

  describe 'Google Valid Sign ins' do
    before(:each) do
      #generates google_oauth account with correct information
      request.env['omniauth.auth'] = FactoryBot.create(:auth_hash, :google_oauth2)
      get :google_oauth2
    end

    context 'Success handling' do
      #user signs in using google's oauth sign in
      let(:member) { Member.find_by(email: 'testuser@gmail.com') }
      it 'should set current_member to proper member' do
        expect(subject.current_member).to eq(member)
      end
    end
  end

  # describe 'Google In-valid sign in' do
  #   before(:each) do
  #     @member_count = Member.count
  #     #user tries to sign in with non-gmail email for oauth sign in
  #     request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter] = FactoryBot.create(:auth_hash, :google_oauth2_fail)
  #     get :google_oauth2
  #   end

  #   context 'Failure handling' do
  #     let(:member) { Member.find_by(email: 'testuser@gmail.com') }
  #     it 'should set current_member to proper member' do
  #       expect(subject.current_member).to eq(member)
  #     end
  #   end
  # end
end
