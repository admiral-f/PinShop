class PagesController < ApplicationController
  before_filter :authenticate_user!, :only=>[:cart, :profile]
  
  def index
  end

  def cart
    @pins=Pin.all
  end

  def profile
    @orders=Order.where(email: current_user)
  end

end
