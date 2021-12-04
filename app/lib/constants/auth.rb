# frozen_string_literal: true

module Constants
  module Auth
    USERS_TYPE = {
      'user' => ::User,
      'owner' => ::Owner
    }.freeze
  end
end
