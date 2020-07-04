class SessionsController < ApplicationController
   skip_before_action :login_required

  def new
  end

  def create
    # binding.pry
    # user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    # if user && user.authenticate(params[:session][:password])
    #   log_in user
    #   redirect_to root_path, notice: "ログインしました"

    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      #authenticateメソッドは引数で受け取ったpasswordをハッシュ化してdigestと一致するか調べる
      session[:user_id] = user.id
      redirect_to posts_path, success: "ログインしました"
    else
      flash.now[:danger] = "ログインできません"
      render :new
    end
  end

  def destroy
    # session.delite(:user_id) #セッションからuser_idをピンポイントで削除
    # @current_user = nil session.delete(:user_id)だけではcurrent_userメソッドが使えるままになっているため、ユーザー情報を削除
    reset_session #ユーザーに紐づく情報を全て削除
    redirect_to root_path, info: "ログアウトしました"
  end

  private

  # def log_in(user)
  #   session[:user_id] = user.id
  #   # 誰もログインしていない状態 session[:user_id] = nil
  #   # 誰かがログインしている状態 session[:user_id] = ログインユーザーのid
  # end
  def session_params
    # binding.pry
    params.require(:session).permit(:email, :password)
  end
end
