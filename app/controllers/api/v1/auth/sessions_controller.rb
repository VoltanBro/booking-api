# frozen_string_literal: true

module Api
  module V1
    module Auth
      class SessionsController < AuthController
        def create
          context = Auth::SessionCreator.call(params: params)

          if context.success?
            render json: context.tokens, status: :created
          else
            render json: context.error, status: context.status
          end
        end
      end
    end
  end
end
