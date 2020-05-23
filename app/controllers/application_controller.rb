class ApplicationController < ActionController::Base
  before_action :login_required
  
  
  helper_method :current_user
  # ログインしているユーザーを取得する処理は頻繁に行うため、コントローラーやビューから簡単に呼べるようcurrent_userとして定義。さらにhelper_methodしていすることで全てのビューから使えるようにした。
  helper_method :logged_in?
  
  add_flash_types :success, :info, :warning, :danger
  # Bootstrapに対応した success info warning danger 4つのキーが使用できる
  
  private
  def login_required
    redirect_to login_path unless current_user
    flash[:warning] = "投稿を見るにはログインしてください"
  end
   
  def current_user #現在ログインしているuserを返すメソッド
    # https://qiita.com/aiandrox/items/f4215471f40325d69523
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in? #ログインしているか確認するメソッド
    !current_user.nil?
  end
  
end
