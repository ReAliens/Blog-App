class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.where(id: params[:id])[0]
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to "#{users_path}/#{current_user.id}" }
      else
        format.html { render :new }
      end
    end
  end

  def post_params
    params.require(:post).permit(:author_id, :title, :text)
  end
end
