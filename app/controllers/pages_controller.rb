class PagesController < ApplicationController
  before_filter :authenticate_user!, :only=>[:cart, :profile, :admin]
  
  def index
  end

  def cart
    @pins=Pin.all
  end

  def profile
    @orders=Order.where("email=?", current_user.email)
  end

  def admin
    if current_user.username!='admin'
      redirect_to pins_path
    end
    @orders=Order.all
    @contacts=Contact.all
  end

end
