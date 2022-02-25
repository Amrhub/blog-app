# this class is for CommentsController
class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post_id = params[:post_id]
    comment = Comment.new(comment_params.merge(user: @user, post_id: @post_id))
    if comment.save
      redirect_to user_post_path(@user.id, @post_id), success: "Your comment was successfully posted!"
    else
      flash.now[:danger] = "Your comment was not posted!"
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
