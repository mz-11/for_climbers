FactoryBot.define do
  factory :user do
    name { "Tester" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password01" }
  end
end
