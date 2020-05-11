class CafeteriasController < ApplicationController
  def index
    @cafeterias = Cafeteria.all
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

  private
  def cafeteria_params
    params.require(:cafeteria).permit(:name, :image, :detail, :addres)
  end
end
