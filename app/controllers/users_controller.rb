class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:comments)
    @first_3_posts = @user.first_three_posts
    @last_3_posts = @user.last_three_posts
  end
end
