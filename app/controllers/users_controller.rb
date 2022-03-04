class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @current_user = current_user
    @users = User.all
  end

  def show
    @current_user = current_user
    @user = User.find_by(id: params[:id])
    redirect_to users_path, danger: "User was not found by given id: #{params[:id]}" if @user.nil?

    @posts = @user&.recent_posts || 'No posts'
  end
end
