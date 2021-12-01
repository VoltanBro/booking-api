# frozen_string_literal: true

module Auth
  class SessionCreator < BaseInteractor
    def call; end

    private

    def user
      context.user = User.find_by!(email: params[:email])
      context.fail!(error: I18n.t('sessions.errors.user_not_found'), status: :not_found) if context.user.nil?
    end

    def authenticate
      context.user.authenticate(params[:password])
    end

    def params
      context.params
    end
  end
end
