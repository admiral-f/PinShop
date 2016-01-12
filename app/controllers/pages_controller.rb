class PagesController < ApplicationController
  before_filter :authenticate_user!, :only=>[:cart]
  
  def index
  end

  def cart
    @pins=Pin.all
  end

end
