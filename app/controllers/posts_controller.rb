class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user_post = Post.find(params[:id])
  end
end
