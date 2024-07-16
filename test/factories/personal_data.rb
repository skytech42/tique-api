# frozen_string_literal: true

FactoryBot.define do
  factory :personal_data do
    email { Faker::Internet.unique.email }
    identifier_number { Faker::Number.unique.number(digits: 10) }
    identifier_type { 'CC' }
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
