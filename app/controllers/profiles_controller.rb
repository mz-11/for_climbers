class ProfilesController < ApplicationController
  def show
    # @profile = Profile.find_by(params[:id])
    # @profile = Profile.find_by(user_id: params[:user_id])
    # @profile = Profile.find_by(params[:user_id])
    # @profile = Profile.find_by(id: params[:id])
    #current_userに関連付けしているため、ここは書かなくて良い。 ルーティングがresourceなのもcurrent_userのみで値を引き出せるため。
  end
  
  def new
    @profile = Profile.new 
  end
  
  
  def create
    # binding.pry
    @profile = Profile.new(profile_params)
    # @profile = current_user.profiles.new(profile_params)
    
    
    if @profile.save
      # flash.now[:success] = "プロフィールを作成しました！"
      redirect_to profile_path, success: "プロフィールを作成しました！"
    else
      flash.now[:danger] = "プロフィールの作成ができませんでした"
      render :new
    end
  end
  
  def edit
    # @profile = Profile.find_by(id: params[:user_id]) user_idと同じ値のプロフィールidを検索することになる。
    @profile = Profile.find_by(user_id: params[:user_id])
  end
  
  
  def update
    @profile = Profile.find_by(params[:user_id])
    # @profile = Profile.find_by(user_id: params[:user_id])
    # binding.pry
    if @profile.update(profile_params)
      redirect_to profile_path, success: "変更を保存しました！"
    else
      render :edit
      flash[:danger] = "変更に失敗しました"
    end
  end
  
  private
  def profile_params
    params.require(:profile).permit(:profile_image, :height, :weight, :usually_grade).merge(user_id: current_user.id)
  end
  

end
