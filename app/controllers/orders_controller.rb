class OrdersController < ApplicationController
  before_filter :authenticate_user!, :only=>[:create, :edit, :show]

  def create 
    @order=Order.new(order_params)
    @order.email=current_user.email
    if @order.adress!='office'
      @order.order_price+=5
    end
    if @order.save
      render action: :show
    else
      @error="your cart is empty"
      redirect_to pins_path
    end
  end

  def show
    if current_user.username=='admin'
      @order=Order.find(params[:id])
    else
      redirect_to pins_path
    end
  end

  def edit
  end

  private

  def order_params
    params.require(:order).permit(:order, :first_name, :last_name, :phone, :adress, :order_price)
  end


end
