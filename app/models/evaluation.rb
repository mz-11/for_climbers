class Evaluation < ApplicationRecord
  validates :point, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  # 1以上5以下の整数に制限
  
  validates_uniqueness_of :post_id, scope: :user_id

  belongs_to :user
  belongs_to :post 
  
  # 5カテゴリーとその合計をまとめて取得 asを使ったらもっと便利？ どうクエリを確認する？？
  def category_groups
    # @category_groups = evaluation_posts.select("category, sum(point)").group("category")
    Evaluation.select("category, sum(point)").group("category")
  end
  
  # def number_of_categories
  #   Evaluation.where("category = ?",params[:category]).count
  # end

  # :searchはクエリ用のメソッドの一種として呼び出す事ができる。
  scope :search, -> (a,b) {where("user_id = ? and category = ?", a,b)}
end


# 各カテゴリーの評価件数(user_id = current_user.id)
# 各カテゴリーの得点合計 = カテゴリーの評価件数 * 各point 
# power = Evaluations.where("category = power")これは コントローラーに書いていく
# 繰り返し記述する内容についてmodelでメソッドとしてまとめる
# 四則演算もmodelにアクティブレコードや生SQLで記述する



