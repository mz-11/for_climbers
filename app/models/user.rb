class User < ApplicationRecord
   validates :name, presence: true, length: {maximum: 15}, uniqueness: true
   
   # メールアドレスの正規表現を追加
   validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
   
   validates :password, presence: true
  
   has_secure_password #gem bcryptをインストールすることで使用できる
   
   has_many :posts
   has_one :user_profile
end
