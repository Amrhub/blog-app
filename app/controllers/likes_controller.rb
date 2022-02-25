class LikesController < ApplicationController
  def create
    Like.create(user: current_user, post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end
end
