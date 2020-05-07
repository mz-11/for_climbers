class EvaluationsController < ApplicationController
  
  def new
  end
  
  def create
    evaluation = Evaluation.new
    evaluation.user_id = current_user.id
    evaluation.post_id = params[:post_id]

    if evaluation.save
      redirect_to posts_path, success: '評価しました！実力チャートを確認しよう！'
    else
      redirect_to posts_path, danger: '評価に失敗しました'
    end
  end
end
