# this class is for CommentsController
class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @current_user = current_user
    @comment = Comment.new
  end

  def create
    @current_user = current_user
    @post_id = params[:post_id]
    @post = Post.find(@post_id)
    comment = Comment.new(comment_params.merge(user: current_user, post_id: @post_id))
    if comment.save
    respond_to do |format|
      format.html do 
        redirect_to user_post_path(@post.user_id, @post_id), success: 'Your comment was successfully posted!'
      end
      format.json { render json: comment }
      end
    else
      respond_to do |format|
        format.html do 
          flash.now[:danger] = 'Your comment was not posted!'
          render :new
        end
        format.json { render json: comment.errors, status: :unprocessable_entity }
        end
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
