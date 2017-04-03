class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # before_action :set_comment
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id
    # @post.comment_id = @comment.id
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # def set_comment
  #   @comment = Comment.find(params[:comment_id])
  # end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
