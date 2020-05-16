class CafeteriasController < ApplicationController
  before_action :authenticate_user!, except: %i[index show search]
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
    @cafeteria = Cafeteria.create(cafeteria_params)
    if @cafeteria.save
      redirect_to cafeterias_path, notice: "子ども食堂を投稿しました。"
    else
      flash.now[:alert] = "画像以外の項目は必ず記入してください。"
      render :new
    end
  end

  def show
    @user = current_user
    @comment = Comment.new
    @comments = @cafeteria.comments.includes(:user)
    @like = Like.new
  end

  def edit
    @user = current_user
    if @cafeteria.user != current_user
      redirect_to cafeterias_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @cafeteria = Cafeteria.find(params[:id])
    if @cafeteria.update(cafeteria_params)
      redirect_to cafeteria_path(@cafeteria.id), notice: "子ども食堂を編集しました。"
    else
      flash.now[:alert] = "画像以外の項目は必ず記入してください。"
      render :edit
    end
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
