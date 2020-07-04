class ProfilesController < ApplicationController
  def show
    # @profile = Profile.find_by(id: params[:id])
    # current_userに関連付けしているため、ここは書かなくて良い。 ルーティングがresourceなのもcurrent_userのみで値を引き出せるため。

    @posts = Post.all.includes(:evaluation_users) #評価した投稿一覧用

    # group byを使ってまとめて取得したほうが良いのか？
    # @category_point = Evaluation.select("category, sum(point)").group("category")
    # @category_groups = evaluation_posts.select("category, sum(point)").group("category")

    # @number_of_categories = .where("category = power", params[:category]).count

    # @power = Evaluation.where(user_id: current_user.id, category: "Power")
    # @dynamic = Evaluation.where(user_id: current_user.id, category: "Dynamic")
    # @balance = Evaluation.where(user_id: current_user.id, category: "Balance")
    # @move = Evaluation.where(user_id: current_user.id, category: "Move")
    # @endurance = Evaluation.where(user_id: current_user.id, category: "Endurance")
    # 値がnillのときは？？？

    # @power_sum = @power.all.sum(:point)
    # @dynamic_sum = @dynamic.all.sum(:point)
    # @balance_sum = @balance.all.sum(:point)
    # @move_sum = @move.all.sum(:point)
    # @endurance_sum = @endurance.all.sum(:point)

    # @power_ave = @power.average(:point).round(1)
    # @dynamic_ave = @dynamic.average(:point).round(1)
    # @balance_ave = @balance.average(:point).round(1)
    # @move_ave = @move.average(:point).round(1)
    # @endurance_ave = @endurance.average(:point).round(1)

    # @power = get_ave_and_calc_ratio(current_user.id, "Power")

    # 評価の有無で条件分岐。未評価は0を代入。

    # binding.pry
    @power_search = Evaluation.search(current_user.id, "Power")
    unless @power_search.blank?
      @power = @power_search.average(:point) / 5 * 100
    else
      @power = 0
    end

    @dynamic_search = Evaluation.search(current_user.id, "Dynamic")
    unless @dynamic_search.blank?
      @dynamic = @dynamic_search.average(:point) / 5 * 100
    else
      @dynamic = 0
    end

    @balance_search = Evaluation.search(current_user.id, "Balance")
    unless @balance_search.blank?
      @balance = @balance_search.average(:point) / 5 * 100
    else
      @balance = 0
    end

   @move_search = Evaluation.search(current_user.id, "Move")
    unless @move_search.blank?
      @move = @move_search.average(:point) / 5 * 100
    else
      @move = 0
    end

    @endurance_search = Evaluation.search(current_user.id, "Endurance")
    unless @endurance_search.blank?
      @endurance = @endurance_search.average(:point) / 5 * 100
    else
      @endurance = 0
    end
  end

  def new
    @profile = Profile.new
  end

  def create
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
