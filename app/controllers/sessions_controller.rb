class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email], password: params[:session][:password])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, notice: "ログインしました"
    else
      flash.now[:alert] = "ログインできません"
      render :new
    end
  end
  
  def destroy
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
    # 誰もログインしていない状態 session[:user_id] = nil
    # 誰かがログインしている状態 session[:user_id] = ログインユーザーのid
  end
    
    
end
