class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/cafeterias/#{comment.cafeteria.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, cafeteria_id: params[:cafeteria_id])
  end
end