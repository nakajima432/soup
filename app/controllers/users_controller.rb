class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cafeterias = @user.cafeterias.page(params[:page]).per(6).order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(@user), alert: "他ユーザーの編集はできません。"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      flash.now[:alert] = "名前とメールアドレスは必ず記入してください。"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :profile, :profile_image )
  end

end