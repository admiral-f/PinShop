class PagesController < ApplicationController
  before_filter :authenticate_user!, :only=>[:cart]

  def index
  end

  def cart
    
  end

end
