class EvaluationsController < ApplicationController
  
  def new
  end
  
  def create
    evaluation = Evaluation.new
    evaluation.user_id = current_user.id
    evaluation.post_id = params[:post_id]

    if evaluation.save
      redirect_to posts_path, success: 'お気に入りに登録しました'
    else
      redirect_to posts_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
end
