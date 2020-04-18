class ApplicationController < ActionController::Base
  helper_method :current_user
  # ログインしているユーザーを取得する処理は頻繁に行うため、コントローラーやビューから簡単に呼べるようcurrent_userとして定義。さらにhelper_methodしていすることで全てのビューから使えるようにした。
  helper_method :logged_in?
  
  private
  def current_user #現在ログインしているuserを返すメソッド
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in? #ログインしているか確認するメソッド
    !current_user.nil?
  end
  
end
