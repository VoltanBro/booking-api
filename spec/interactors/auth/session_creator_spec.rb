describe Auth::SessionCreator do
  subject(:context) { Auth::SessionCreator.call(params: params) }
  let(:user) { create(:user, password: password) }
  let(:password) { FFaker::Internet.password }
  let(:params) { { email: user.email, password: password } }

  describe "create session" do
    context "when given valid params" do
      it "succeeds" do
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
end
