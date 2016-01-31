class PinsController < ApplicationController
  before_filter :authenticate_user!, :only=>[:new, :create, :edit, :update, :destroy]
  def index
    @categories=Category.all
    @pin=Pin.all.paginate(:page => params[:page], :per_page => 6)
  end

  def new
    if current_user.username=='admin'
      
    else
      redirect_to pins_path

    end
  end

  def show
    @pin=Pin.find(params[:id])
  end

  def create
    @pin=Pin.new(pin_params)
    if @pin.save
      redirect_to @pin
    else
      render action: 'new'
    end
  end

  def edit
    if current_user.username=='admin'
      @pin=Pin.find(params[:id])
    else
      redirect_to pins_path
    end
  end

  def update
    @pin=Pin.find(params[:id])
    if @pin.update(pin_params)
      redirect_to @pin
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin=Pin.find(params[:id])
    @pin.destroy
    redirect_to @pin
  end

  private

  def pin_params
    params.require(:pin).permit(:label, :price, :material, :description, :image, :is_best_offer, :category_id)
  end

end
