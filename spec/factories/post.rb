# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    body { Faker::MostInterestingManInTheWorld.quote }

    association :user, :with_profile, strategy: :build
  end
end
