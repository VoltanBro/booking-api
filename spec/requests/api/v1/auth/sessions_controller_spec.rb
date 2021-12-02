# frozen_string_literal: true

RSpec.describe Api::V1::Auth::SessionsController, type: :request do
  let(:user) { create(:user, password: password) }
  let(:password) { FFaker::Internet.password }
  let(:params) { { email: user.email, password: password } }

  before { post  api_v1_auth_session_path, params: params }

  it 'creates session' do
    expect(response).to have_http_status(:created)
  end
end
