class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.includes(:user, :comments), items: 2)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other, notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(:description, { images: [] })
  end
end
