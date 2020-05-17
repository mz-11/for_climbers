class EvaluationsController < ApplicationController
  
  def new
  end
  
  def create
    evaluation = Evaluation.new
    evaluation.user_id = current_user.id
    evaluation.post_id = params[:post_id]
    evaluation.point = params[:point]
    evaluation.category = params[:category]
    
    if evaluation.save
      redirect_to posts_path, success: '評価しました！実力チャートを確認しよう！'
    else
      redirect_to posts_path, danger: '評価に失敗しました'
    end
  end
  
  def update
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update(point: params[:point])
      redirect_to posts_path, success: "評価を変更しました！"
    else
      render "/posts"
      flash.now[:danger] = "変更に失敗しました"
    end
  end
  
  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy
    # binding.pry
    redirect_to posts_path, success: "評価を取り消しました"
  end
  
end
