class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    redirect_to users_path if @user.nil?
    @posts = @user&.posts || 'No posts'
  end

  def show
    @user = User.find_by(id: params[:user_id])
    redirect_to users_path if @user.nil?
    @post = @user.posts.find_by(id: params[:id])
    redirect_to user_posts_path(@user.id) if @post.nil?
  end
end
