# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name { Faker::Cat.name.to(19) }
    last_name  { Faker::HitchhikersGuideToTheGalaxy.planet.to(19) }
    birthday   { Faker::Date.between(60.years.ago, 18.years.ago) }
    sex        { Profile.sexes.keys.sample }

    association :user, strategy: :build
  end
end
