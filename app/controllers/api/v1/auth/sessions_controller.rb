# frozen_string_literal: true

module Api
  module V1
    module Auth
      class SessionsController < AuthController
        before_action :authorize_access_request!, except: %i[update]
        before_action :authorize_refresh_request!, only: %i[update]

        def create
          context = ::Auth::SessionCreator.call(params: session_params)

          if context.success?
            render json: context.tokens, status: :created
          else
            render json: context.error, status: context.status
          end
        end

        def update
          context = ::Auth::TokensRefresher.call(current_user: current_user, found_token: found_token)

          if context.success?
            render json: context.tokens, status: :ok
          else
            render json: context.error, status: context.status
          end
        end

        private

        def session_params
          params.require(:session).permit(:email, :password)
        end
      end
    end
  end
end
