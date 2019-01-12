# frozen_string_literal: true

FactoryBot.define do
  factory :dialogue do
    trait :with_messages do
      after(:create) do |dialogue|
        create_list(:message, rand(1..3), dialogue: dialogue)
      end
    end
  end
end
