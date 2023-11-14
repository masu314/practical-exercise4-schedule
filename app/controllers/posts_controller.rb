class PostsController < ApplicationController
  def index
    @posts = Post.all # 全ての予約内容を@postに格納
  end

  def new
    @post = Post.new  # インスタンスを作成し、@postに格納
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_day, :end_day, :all_day, :memo)) # フォームに入力された内容を受け取って、作成されたインスタンスに値を入れ、＠postに格納
    if @post.save # 保存された場合
      flash[:notice] = "予定を登録しました"
      redirect_to :posts
    else # 保存されなかった場合
      flash[:notice] = "予定の登録に失敗しました"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id]) # URLのidをもとに予約情報を取得し、@postに格納
  end

  def edit
    @post = Post.find(params[:id]) # URLのidをもとに予約情報を取得し、@postに格納
  end

  def update
    @post = Post.find(params[:id]) # URLのidをもとに予約情報を取得し、@postに格納
    if @post.update(params.require(:post).permit(:title, :start_day, :end_day, :all_day, :memo)) # 更新された場合
      flash[:notice] = "予定を更新しました"
      redirect_to :posts
    else # 更新されていない場合
      flash[:notice] = "予定の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id]) # URLの情報をもとに予約情報を取得し、@postに格納
    @post.destroy # 予約情報を削除
    flash[:notice] = "予定を削除しました"
    redirect_to :posts
  end

end
