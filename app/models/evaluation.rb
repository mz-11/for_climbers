class Evaluation < ApplicationRecord
  validates :point, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  # 1以上5以下の整数に制限
  
  validates_uniqueness_of :post_id, scope: :user_id

  belongs_to :user
  belongs_to :post 
  
  # 評価した任意カテゴリーを取得
  def search_categories(category) #引数付きメソッド
    # @search_categories = Evaluation.where(user_id: current_user.id, category: "#{category}")
    evaluation_posts.where(category: "#{category}")
  end
  
  # 任意カテゴリーの合計を計算
  def sum_points(category)
    @sum_points = search_categories.sum("#{category}")
  end
  
  def result(category)
    # 任意カテゴリーの平均点
    return  sum_points(power) / search_categories(category).count * 100
  end
  
  
  # 5カテゴリーとその合計をまとめて取得 asを使ったらもっと便利？ どうクエリを確認する？？
  def category_groups
    # @category_groups = evaluation_posts.select("category, sum(point)").group("category")
    Evaluation.select("category, sum(point)").group("category")
  end
  
  # def number_of_categories
  #   Evaluation.where("category = ?",params[:category]).count
  # end
  
  # def a_b(a,b) #テスト用 => 成功
  #   a * b
  # end
  
  #指定されたユーザーidとカテゴリーを検索し、pointの平均値を算出。その後平均値を％表示に変換するメソッド
  # def get_ave_and_calc_ratio(a,b)
  #   c_point = Evaluation.where("user_id = ? and category = ?", "a", "b").average(:point) #スコープとして
  #   c_point / 5 * 100 #コントローラに
  # end  

  # :searchはクエリ用のメソッドの一種として呼び出す事ができる。
  scope :search, -> (a,b) {where("user_id = ? and category = ?", a,b)}
  # scope :search, -> (a,b) {where("user_id = ? and category = ?", params[:a], params[:b])}
  # scope :search, -> {where("user_id = ? and category = ?", params[:user_id], params[:category])}
  # scope :search, -> (a) {where("user_id = ?", a)}

end


# 各カテゴリーの評価件数(user_id = current_user.id)


# 各カテゴリーの得点合計 = カテゴリーの評価件数 * 各point 
# power = Evaluations.where("category = power")これは コントローラーに書いていく
# 繰り返し記述する内容についてmodelでメソッドとしてまとめる
# 四則演算もmodelにアクティブレコードや生SQLで記述する



