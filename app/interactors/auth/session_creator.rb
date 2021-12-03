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
      fail_context(I18n.t('sessions.errors.user_not_found'), :not_found) if context.user.blank?
    end

    def authenticate
      user = context.user.authenticate(params[:password])
      fail_context(I18n.t('sessions.errors.invalid_password'), :unauthorized) if user.blank?
    end

    def tokens
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true).login
      context.tokens = { access: session[:access], refresh: session[:refresh] }
      context.status = :created
    end

    def payload
      { email: context.user.email }
    end

    def params
      context.params
    end
  end
end
