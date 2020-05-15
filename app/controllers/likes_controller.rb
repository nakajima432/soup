class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(cafeteria_id: params[:cafeteria_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(cafeteria_id: params[:cafeteria_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
