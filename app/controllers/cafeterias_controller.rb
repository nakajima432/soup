class CafeteriasController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_cafeteria, only: [:show, :edit]

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
  end

  def edit
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
