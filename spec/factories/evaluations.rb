FactoryBot.define do
  factory :evaluation do
    user # associationメソッド。modelとfactory名が一緒のときはassociation:を省略可能
    post
    point { rand(1..5) }
  end
end
