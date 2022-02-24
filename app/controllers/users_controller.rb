class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    redirect_to users_path if @user.nil?
    @posts = @user&.recent_posts || 'No posts'
  end
end
