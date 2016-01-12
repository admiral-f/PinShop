class OrdersController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create, :edit]

  def create 
    @order=Order.new(order_params)
    @order.email=current_user.email
    @order.phone=current_user.phone
    @order.first_name=current_user.first_name
    @order.last_name=current_user.last_name
    if @order.save
      redirect_to @order
    else
      @error="your cart is empty"
      redirect_to pins_path
    end
  end

  def edit
  end

  private

  def order_params
    params.require(:order).permit(:order)
  end


end
