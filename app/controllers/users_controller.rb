class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    # binding.pry #処理を止め値を確認できる pry系gem 
    # @user = User.new(name: params[:user][:name], email: params[:user][:email])
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "#{@user.name}さんの登録が完了しました！"
      # noticeが表示されるようにはviewの設定を行う
    else
      flash.now[:alert] = "登録に失敗しました！"
      render :new
    end
  end
  
  def edit
  end
  
  private 
  def user_params #passwordの実装にはhas_secure_passwordをモデルに設定する
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
