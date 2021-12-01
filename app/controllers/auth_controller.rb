# frozen_string_literal: true

class AuthController < ApplicationController
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def not_authorized
    render json: { error: I18n.t('sessions.errors.not_authorized') }, status: :unauthorized
  end
end
