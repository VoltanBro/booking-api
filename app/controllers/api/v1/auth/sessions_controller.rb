# frozen_string_literal: true

module Api
  module V1
    module Auth
      class SessionsController < AuthController
        before_action :authorize_access_request!, except: %i[create update]
        before_action :authorize_refresh_request!, only: %i[update]

        def create
          context = ::Auth::SessionCreator.call(params: session_params)

          result(context)
        end

        def update
          context = ::Auth::AccessTokenRefresher.call(current_user: current_user, found_token: found_token)

          result(context)
        end

        def destroy
          context = ::Auth::SessionDestroyer.call(payload: payload)

          result(context)
        end

        private

        def session_params
          params.permit(:email, :password)
        end

        def result(context)
          if context.success?
            render json: context.tokens, status: context.status
          else
            render json: context.error, status: context.status
          end
        end
      end
    end
  end
end
