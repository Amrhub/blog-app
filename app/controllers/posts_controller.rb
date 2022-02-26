class PostsController < ApplicationController
  def index
    @current_user = current_user
    @user = User.find_by(id: params[:user_id])
    redirect_to users_path if @user.nil?
    @posts = @user.posts.includes(:comments)
  end

  def show
    @current_user = current_user
    @user = User.find_by(id: params[:user_id])
    redirect_to users_path, danger: "No user was found by given the id: #{params[:user_id]}" if @user.nil?
    @post = @user.posts.find_by(id: params[:id])
    
    redirect_to user_posts_path(@user.id), danger: "No post was found by given id: #{params[:id]}" if @post.nil?
  end

  def new
    @current_user = current_user
    @post = Post.new
    @user = current_user
  end

  def create
    @current_user = current_user
    redirect_to users_path, danger: "No user was found by given the id: #{params[:user_id]}" if @current_user.nil?
    @post = @current_user.posts.new(post_params)
    if @post.valid?
      @post.save
      redirect_to user_path(@current_user.id), success: 'Post was successfully created'
    else
      flash.now[:danger] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
