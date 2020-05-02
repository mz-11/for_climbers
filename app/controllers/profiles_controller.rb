class ProfilesController < ApplicationController
  def new
    @profile = Profile.new 
  end
  
  def show
    # binding.pry
    # @profile = Profile.find_by(id: session[:user_id])
    @profile = Profile.find_by(profile_params)
  end
  
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path
    else
      flash.now[:danger] = "プロフィールの変更ができません"
      render :new
    end
      
  end
  
  def edit
  end
  
  def update
  end
  
  private
  def profile_params
    params.require(:profile).permit(:profile_image, :height, :weight, :usually_grade)
  end
  

end
