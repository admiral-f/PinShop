class PinsController < ApplicationController

  def new
  end

  def create
    @pin=Pin.new(pin_params)
    if @pin.save
      redirect_to @pin
    else
      render action: 'new'
    end
  end


  private

  def pin_params
    params.require(:pin).permit(:label, :price, :material, :description, :image, :is_best_offer)
  end

end
