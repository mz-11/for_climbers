FactoryBot.define do
  factory :post do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/_318-9776.jpg')) }
    gym_name { "B-Pump" }
    grade { "2級" }
    category { "power" }
    association :user
  end
end
