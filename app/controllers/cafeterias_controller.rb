class CafeteriasController < ApplicationController
  def index
    @cafeterias = Cafeteria.all
  end
end
