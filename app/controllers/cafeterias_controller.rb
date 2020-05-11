class CafeteriasController < ApplicationController
  def index
    @cafeterias = Cafeteria.includes(:user)
  end

  def new
    @cafeteria = Cafeteria.new
  end

  def create
    Cafeteria.create(cafeteria_params)
    redirect_to cafeterias_path
  end

  def show
    @cafeteria = Cafeteria.find(params[:id])
  end

  def edit
    @cafeteria = Cafeteria.find(params[:id])
  end

  def update
    cafeteria = Cafeteria.find(params[:id])
    cafeteria.update(cafeteria_params)
    redirect_to cafeteria_path(cafeteria.id)
  end

  def destroy
    cafeteria = Cafeteria.find(params[:id])
    cafeteria.destroy
    redirect_to cafeterias_path
  end

  private
  def cafeteria_params
    params.require(:cafeteria).permit(:name, :image, :detail, :addres).merge(user_id: current_user.id)
  end
end
