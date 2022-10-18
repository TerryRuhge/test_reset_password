# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Members::OmniauthCallbacksController, type: :controller do
  before(:each) do
    # @controller = omniauth_callbacks_controller.new
    request.env['devise.mapping'] = Devise.mappings[:member]
  end

  describe 'Google' do
    context 'Success handling' do
      before(:each) do
        request.env['omniauth.auth'] = FactoryBot.create(:auth_hash, :google_oauth2)
        get :google_oauth2
      end
      let(:member) { Member.find_by(email: 'testuser@gmail.com') }
      it 'should set current_member to proper member' do
        expect(subject.current_member).to eq(member)
      end
    end

    context 'Non-persisting User' do
      before(:each) do
        request.env['omniauth.auth'] = FactoryBot.create(
          :auth_hash, :google_oauth2_fail
        )
        get :google_oauth2
      end
      it 'should redirect to new user registration' do
        expect(response).to redirect_to root_path
      end
      let(:member) { Member.find_by(email: 'dadfasd@gmail.com') }
      it 'should set current_member to proper member' do
        expect(subject.current_member).to eq(member)
      end

      # it 'should set flash :notice' do
      #   expect(flash[:notice]).to exist
      # end
    end
  end
end
