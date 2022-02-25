class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    redirect_to users_path if @user.nil?
    @posts = @user&.posts || "No posts"
  end

  def show
    @user = User.find_by(id: params[:user_id])
    redirect_to users_path, danger: "No user was found by given the id: #{params[:user_id]}" if @user.nil?
    @post = @user.posts.find_by(id: params[:id])
    redirect_to user_posts_path(@user.id), danger: "No post was found by given id: #{params[:id]}" if @post.nil?
  end

  def create; end
  def new; end
end
