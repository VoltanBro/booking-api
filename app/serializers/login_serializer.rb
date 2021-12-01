# frozen_string_literal: true

class LoginSerializer
  include JSONAPI::Serializer
  attributes :access_token, :refresh, :access_expires_at, :refresh_expires_at
end
