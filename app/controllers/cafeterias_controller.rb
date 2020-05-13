class CafeteriasController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_cafeteria, only: [:show, :edit]

  def index
    @user = current_user
    @cafeterias = Cafeteria.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @user = current_user
    @cafeteria = Cafeteria.new
  end

  def create
    Cafeteria.create(cafeteria_params)
    redirect_to cafeterias_path
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
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

  def set_cafeteria
    @cafeteria = Cafeteria.find(params[:id]) 
  end

end
