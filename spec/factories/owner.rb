# frozen_string_literal: true

FactoryBot.define do
  factory :owner do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
  end
end
