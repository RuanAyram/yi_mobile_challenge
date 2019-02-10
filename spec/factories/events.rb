# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'No event aux' }
    description { 'default description' }
    lat { -5.1863822 }
    lng { -43.0643717 }
  end
end
