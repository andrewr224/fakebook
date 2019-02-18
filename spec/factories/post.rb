# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    body { Faker::MostInterestingManInTheWorld.quote.to(100) }

    association :user, :with_profile, strategy: :build
  end
end
