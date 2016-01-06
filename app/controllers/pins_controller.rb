class PinsController < ApplicationController

  def index
    @pin=Pin.all
  end

  def new
    @category=Category.all
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
    @pin=Pin.find(params[:id])
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
    params.require(:pin).permit(:label, :price, :material, :description, :image, :is_best_offer)
  end

end
