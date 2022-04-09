class PostsController < ApplicationController
  def index
    @posts = Post.includes(:comments, :likes).where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
    authorize! :destroy, @post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_posts_url(current_user), notice: 'Post created successfully' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
