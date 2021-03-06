class LikesController < ApplicationController
  def create
    @post_id = params[:post_id]
    @current_user = current_user

    if liked?
      flash[:danger] = 'You have already liked this post!'
    else
      Like.create(user: current_user, post_id: @post_id)
      flash[:success] = 'You have successfully liked this post!'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def liked?
    Like.find_by(user: @current_user, post_id: @post_id).present?
  end
end
