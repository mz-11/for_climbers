class PostsController < ApplicationController
  
  def index
    @posts = Post.all.includes(:evaluation_users)
    # eachのループ処理による「N＋１問題」を防ぐためにincludesを使用。includesは指定したモデルのデータを一括で取得しキャッシュできる。
    #:evaluation_usersはpost.rbで作成したモデル名
    
    # @evaluation = Evaluation.find_by(user_id: current_user.id, post_id: params[:post_id])
    @evaluations = Evaluation.where(user_id: current_user.id)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  # def edit
  # end
  
  def create
    # binding.pry
    # @post = Post.new(post_params)
    # => ActiveRecord::RecordInvalid (Validation failed: User must existが生じてしまう https://gyazo.com/156d8389d6b4e8bb20040ed32a4c17a3  下記以外の書き方はないのか？？ => 以下の用にuser_idにcurrent_user.idを渡せば良い？
    # @post = Post.new(post_params)
    # @post.user_id = current_user.id
    
    @post = current_user.posts.new(post_params)
    if @post.save
      #save!とすればレコードの作成・保存に失敗時例外を発生させることでエラーが生じる
      flash.now[:success] = '投稿に成功しました'
      redirect_to posts_path
    else
      render :new
      flash.now[:danger] = "投稿に失敗しました"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path, success: "変更を保存しました！"
    else
      render :edit
      flash[:danger] = "変更に失敗しました"
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path, success: '投稿を削除しました'
  end
  
  private 
  def post_params
    params.require(:post).permit(:image, :gym_name, :grade, :category, :description)
  end
  

end
