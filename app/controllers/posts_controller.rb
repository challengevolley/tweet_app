class PostsController < ApplicationController
  before_action :authenticate_user
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def new
    # Postクラスのインスタンスを作成し、変数@postに代入
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content])
    # 保存に成功した場合は投稿一覧ページ、保存に失敗した場合は新規投稿ページが表示
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
    flash[:notice] = "投稿を編集しました"
    redirect_to("/posts/index")
    else
    # renderメソッドを用いて、editアクションを経由せず、posts/edit.html.erbが表示されるようにしてください
    render("/posts/edit")
    #redirect_to("/posts/#{@post.id}/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
end
