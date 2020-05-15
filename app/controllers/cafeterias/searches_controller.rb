class Cafeterias::SearchesController < ApplicationController
  def index
    @cafeterias = Cafeteria.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(6)
  end
end
