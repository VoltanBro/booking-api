# frozen_string_literal: true

module Auth
  class TokensRefresher < BaseInteractor
    def call
      session
    end

    private

    def session
      session = JWTSessions::Session.new(payload: payload)
      tokens = session.refresh(context.found_token)
      context.tokens = { access: tokens[:access] }
    end

    def payload
      { email: context.current_user.email }
    end
  end
end
