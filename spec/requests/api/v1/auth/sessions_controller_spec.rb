# frozen_string_literal: true

RSpec.describe Api::V1::Auth::SessionsController, type: :request do
  let(:user) { create(:user, password: password) }
  let(:password) { FFaker::Internet.password }
  let(:params) { { email: user.email, password: password, user_type: 'user' } }

  describe 'POST create' do
    before { post api_v1_auth_session_path, params: params }

    context 'when SUCCESS' do
      it 'creates session' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when FAILURE' do
      context 'when email is invalid' do
        let(:invalid_email) { FFaker::Lorem.word }
        let(:params) { { email: invalid_email, password: password, user_type: 'user' } }

        it 'return not found' do
          expect(response).to have_http_status(:not_found)
        end
      end

      context 'when password is invalid' do
        let(:invalid_password) { FFaker::Internet.password }
        let(:params) { { email: user.email, password: invalid_password, user_type: 'user' } }

        it 'return unauthorized' do
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
