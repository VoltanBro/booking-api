# frozen_string_literal: true

module Auth
  class SessionCreator < BaseInteractor
    def call
      user
      authenticate
      tokens
    end

    private

    def user
      context.user = User.find_by(email: params[:email])
      context.fail!(error: I18n.t('sessions.errors.user_not_found'), status: :not_found) if context.user.nil?
    end

    def authenticate
      if context.user.authenticate(params[:password])
        context.fail!(error: I18n.t('sessions.errors.invalid_password'), status: :unauthorized)
      end
    end

    def tokens
      session = JWTSessions::Session.new(payload: payload).login
      context.tokens = { access: session[:access], refresh: session[:refresh] }
    end

    def payload
      { email: context.user.email }
    end

    def params
      context.params
    end
  end
end
