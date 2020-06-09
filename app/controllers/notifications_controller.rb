class NotificationsController < ApplicationController
  def index
    @user = current_user
    @notifications=current_user.passive_notifications.page(params[:page]).per(10)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path(current_user)
  end
end