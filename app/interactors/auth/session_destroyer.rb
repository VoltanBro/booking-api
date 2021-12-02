# frozen_string_literal: true

module Auth
  class SessionDestroyer < BaseInteractor
    def call
      destroy_session
    end

    private

    def session
      JWTSessions::Session.new(refresh_by_access_allowed: true, payload: context.payload)
    end

    def destroy_session
      session.flush_by_access_payload
      context.status = :no_content
    end
  end
end
