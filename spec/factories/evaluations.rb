FactoryBot.define do
  factory :evaluation do
    post # associationメソッド。modelとfactory名が一緒のときはassociation:を省略可能
    user { post.user }
    point { rand(1..5) }
    category { "power" }
  end
end
