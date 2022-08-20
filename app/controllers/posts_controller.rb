class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user: @user.id)
  end

  def show
    @user_post = Post.find(params[:id])
  end

  def new
    @new_post = Post.new
  end

  def create
    post = params[:post]
    user = User.find(params[:user_id])
    new_post = Post.new(post.permit(:title, :text))
    new_post.comment_counter = 0
    new_post.like_counter = 0
    new_post.author_id = user.id

    if new_post.save
      flash[:notice] = 'New post created successfully.'
      redirect_to user_post_url(user, new_post)
    else
      flash[:error] = 'Creating new post failed!'
      @post = new_post
      render :new
    end
  end
end
