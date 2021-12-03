# frozen_string_literal: true

# == Schema Information
#
# Table name: owners
#
#  id              :uuid             not null, primary key
#  email           :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_owners_on_email  (email) UNIQUE
#
class Owner < ApplicationRecord
  has_secure_password

  has_many :real_estates, as: :rentable, dependent: :destroy
end
