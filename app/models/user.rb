# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  has_many :real_estates, as: :rentable, dependent: :nullify
end
