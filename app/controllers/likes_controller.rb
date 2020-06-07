class LikesController < ApplicationController

  def create
    @cafeteria = Cafeteria.find(params[:cafeteria_id])
    like = current_user.likes.create(cafeteria_id: params[:cafeteria_id])
    like.save
  end

  def destroy
    @cafeteria = Cafeteria.find(params[:cafeteria_id])
    like = Like.find_by(cafeteria_id: params[:cafeteria_id], user_id: current_user.id)
    like.destroy
  end

end
