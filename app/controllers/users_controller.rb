class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cafeterias = @user.cafeterias
  end
end
