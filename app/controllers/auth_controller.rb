# frozen_string_literal: true

class AuthController < ApplicationController
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def not_authorized
    render json: { error: I18n.t('sessions.errors.not_authorized') }, status: :unauthorized
  end

  def current_user
    @current_user ||= users_type.find_by(payload['email'])
  end

  def users_type
    Constants::Auth :USERS_TYPE[params[:user_type]]
  end
end
