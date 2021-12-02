# frozen_string_literal: true

module Auth
  class AccessTokenRefresher < BaseInteractor
    def call
      session
    end

    private

    def session
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.refresh(context.found_token)
      context.tokens = { access: tokens[:access] }
      context.status = :ok
    end

    def payload
      { email: context.current_user.email }
    end
  end
end
