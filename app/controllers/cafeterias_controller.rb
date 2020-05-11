class CafeteriasController < ApplicationController
  def index
    @cafeterias = Cafeteria.all
  end

  def new
  end
end
