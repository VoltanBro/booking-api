# frozen_string_literal: true

module Api
  module V1
    class UsersController < AuthController
      def create
        EntityCreator.call(user_params)
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :phone, :user_type)
      end
    end
  end
end
