# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    text { Faker::HitchhikersGuideToTheGalaxy.quote.to(99) }

    association :user,     strategy: :build
    association :dialogue, strategy: :build
  end
end
