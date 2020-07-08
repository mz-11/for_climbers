FactoryBot.define do
  factory :user do
    name { "user01" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password01" }
  end
end
