# frozen_string_literal: true

module Api
  module V1
    module Auth
      class SessionsController < AuthController
        def create
          user = User.find_by!(email: params[:email])
          if user.authenticate(params[:password])
            payload = { user_id: user.id }
            session = JWTSessions::Session.new(payload: payload)
            render json: session.login
          else
            render json: 'Invalid user', status: :unauthorized
          end
        end
      end
    end
  end
end
