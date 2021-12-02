# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    phone { FFaker::PhoneNumber.phone_number }
  end
end
