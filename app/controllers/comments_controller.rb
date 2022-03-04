# this class is for CommentsController
class CommentsController < ApplicationController
  def new
    @current_user = current_user
    @comment = Comment.new
  end

  def create
    @current_user = current_user
    @post_id = params[:post_id]
    @post = Post.find(@post_id)
    comment = Comment.new(comment_params.merge(user: @current_user, post_id: @post_id))
    if comment.save
      redirect_to user_post_path(@post.id, @post_id), success: 'Your comment was successfully posted!'
    else
      flash.now[:danger] = 'Your comment was not posted!'
      render :new
    end
  end

  def destroy
    @current_user = current_user
    @post_id = params[:post_id]
    @post = Post.find(@post_id)
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@post.user_id, @post_id), success: 'Your comment was successfully deleted!'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
