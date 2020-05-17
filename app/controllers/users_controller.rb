class UsersController < ApplicationController
  before_action :set_user

  def show
    @cafeterias = @user.cafeterias.page(params[:page]).per(6).order("created_at DESC")
  end

  def edit
    if @user != current_user
      redirect_to user_path(@user), alert: "他ユーザーの編集はできません。"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      flash.now[:alert] = "名前とメールアドレスは必ず記入してください。"
      render :edit
    end
  end

  def following
    @users = @user.following
  end

  def followers
    @users = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile, :profile_image )
  end

  def set_user
    @user = User.find(params[:id])
  end

end
