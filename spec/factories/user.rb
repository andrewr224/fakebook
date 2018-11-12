# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email    { Faker::Internet.email }
    password { Faker::Internet.password(4, 5) }
  end
end