class CatsController < ApplicationController
  def index
    @kitties = Cat.all
  end

  def show
    @kitty = Cat.find_by(id: params[:id])
    
    # if @kitty 
    #   render json: @kitty
    # else
    #   render json: "kitty not found"
    # end
  end

  def new
    @kitty = Cat.new
  end

  def create
    @kitty = Cat.create(cat_params)
    @kitty.save!
    render :show
  end

  def edit
    @kitty = Cat.find_by(id: params[:id])
  end

  def update
    @kitty = Cat.find_by(id: params[:id])
    Cat.update(@kitty.id, cat_params)
    render :show
  end


  private
  def cat_params
    params.require(:kitty).permit(:name, :color, :birth_date, :sex, :description)
  end
end