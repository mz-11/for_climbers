class UsersController < ApplicationController
   skip_before_action :login_required
   
  def new
    @user = User.new
  end
  
  def create
    # binding.pry #処理を止め値を確認できる pry系gem 
    # @user = User.new(name: params[:user][:name], email: params[:user][:email])
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: "#{@user.name}さんの登録が完了しました。こちらよりログインしてください！"
      # noticeが表示されるようにはviewの設定を行う
    else
      flash.now[:danger] = "登録に失敗しました！"
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_path, success: "変更を保存しました！"
    else
      render :edit
      flash[:danger] = "変更に失敗しました"
    end
  end
  
  private 
  def user_params #passwordの実装にはhas_secure_passwordをモデルに設定する
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
