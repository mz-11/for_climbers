class UserProfileController < ApplicationController
  
  def new
    @profile = UserProfile.new 
  end
  
  def show
    @profile = UserProfile.find_by(user_id: current_user.id)
    
  end
  
  def create
    
  end
  
  def edit
  end
  
  def update
  end
  
end
