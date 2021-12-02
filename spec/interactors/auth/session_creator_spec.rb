# frozen_string_literal: true

describe Auth::SessionCreator do
  subject(:context) { described_class.call(params: params) }

  let(:user) { create(:user, password: password) }
  let(:password) { FFaker::Internet.password }
  let(:params) { { email: user.email, password: password } }

  describe 'create session' do
    context 'when SUCCESS' do
      context 'when given valid params' do
        it 'succeeds' do
          expect(context).to be_a_success
        end

        it 'return access token' do
          expect(context.tokens[:access]).to be_truthy
        end

        it 'return refresh token' do
          expect(context.tokens[:refresh]).to be_truthy
        end
      end
    end

    context 'when FAILURE' do
      context 'when given invalid email' do
        let(:params) { { email: FFaker::Lorem.word, password: password } }

        it 'failure' do
          expect(context).to be_a_failure
          expect(context.error).to eq(I18n.t('sessions.errors.user_not_found'))
        end
      end
    end
  end
end
