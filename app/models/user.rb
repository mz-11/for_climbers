class User < ApplicationRecord
   validates :name, presence: true, length: {maximum: 15}, uniqueness: true
   
   # メールアドレスの正規表現を追加
   validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: true
   
   # 半角英数字をそれぞれ1種類以上含む8文字以上100文字以下の正規表現
   # validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}, uniqueness: true passwordにuniqunessはつけない!
   validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i}
   
   
   # has_secure_passwordはbcryptをインストールすることで使用できる
   # DB内のpassword_digestという属性にハッシュ化したパスワードを保存し、password_confirmationが使えるようになる
   has_secure_password 
   
   has_many :posts, dependent: :destroy
   has_one :profile, dependent: :destroy
   has_many :evaluations, dependent: :destroy
   has_many :evaluation_posts, through: :evaluations, source: :post
   # throughオプションによりevaluations経由でpostを取得
   # sourceオプションでevaluation.rbで設定しているbelongs_to :postを参照する。これによりuser.evaluation_postsと書けばuserが評価した投稿を一気に取得できる
   # オプションはアソシエーションの名前を外部キーの名前から外れた名前にする場合に設定する
end


