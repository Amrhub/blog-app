class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    redirect_to users_path if @user.nil?
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])

    @post = Post.find(params[:id])
  end
end
