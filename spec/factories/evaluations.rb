FactoryBot.define do
  factory :evaluation do
    post # associationメソッド。modelとfactory名が一緒のときはassociation:を省略可能
    user { post.user } # userだけだとuserデータが２つ作られてしまう
    point { rand(1..5) }
    category { "Power" }
    # category { ["Power","Dynamic", "Balence", "Move", "Endulance"].sample }
  end
end
